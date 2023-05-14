require 'base64'
require 'securerandom'
require 'openssl'
require 'io/console'

#
# Crypto Module
# Handle Encryption, Decryption, Password handling and generation
#
module Crypto
  ##
  # Encrypts recieved line
  ##
  def self.encrypt_line(to_encrypt)
    cipher = OpenSSL::Cipher.new('AES-256-CBC')
    cipher.encrypt
    cipher.key = get_password('Insert Encryption Password')
    cipher.iv = Base64.decode64('xZV1H8GvUiM/JbhErPijjg==')
    encrypted = cipher.update(to_encrypt) + cipher.final
  end

  ##
  # Encrypts Line, Password Pre Gathered
  ##
  def self.auto_encrypt(to_encrypt, password)
    cipher = OpenSSL::Cipher.new('AES-256-CBC')
    cipher.encrypt
    cipher.key = password
    cipher.iv = Base64.decode64('xZV1H8GvUiM/JbhErPijjg==')
    encrypted = cipher.update(to_encrypt) + cipher.final
  end

  ##
  # Decrypts Recieved Line
  ##
  def self.decrypt_line(encrypted_line, password)
    decipher = OpenSSL::Cipher.new('AES-256-CBC')
    decipher.decrypt
    decipher.key = password
    decipher.iv = Base64.decode64('xZV1H8GvUiM/JbhErPijjg==')
    begin
      decipher.update(encrypted_line) + decipher.final
    rescue OpenSSL::Cipher::CipherError
      puts 'ERROR: Decryption Fail! Incorrect Password!'.red.bold
      exit(1)
    end
  end

  def self.auto_decrypt(encrypted_line, password)
    decipher = OpenSSL::Cipher.new ('AES-256-CBC')
    decipher.decrypt
    decipher.key = auto_get_password(password)
    decipher.iv = Base64.decode64('xZV1H8GvUiM/JbhErPijjg==')
    begin
      decipher.update(encrypted_line) + decipher.final
    rescue OpenSSL::Cipher::CipherError
      puts 'ERROR: Decryption Fail! Incorrect Password!'
      exit(1)
    end
  end
  
  ##
  # Automagically gets password.
  ##
  def self.auto_get_password(password)
    cipher = OpenSSL::Cipher.new('AES-256-CBC')
    salt = Base64.decode64('CsIktLdJltDHkpK8ZAeIFA==')
    iter = 20_000
    key_len = cipher.key_len
    digest = OpenSSL::Digest.new('SHA256')

    OpenSSL::PKCS5.pbkdf2_hmac(password, salt, iter, key_len, digest)
  end

  ##
  # Prompts user for Password, Doesn't echo.
  ##
  def self.get_password(instruction)
    cipher = OpenSSL::Cipher.new('AES-256-CBC')
    puts "#{instruction}".bold.cyan

    pwd = $stdin.noecho(&:gets).chomp

    salt = Base64.decode64('CsIktLdJltDHkpK8ZAeIFA==')
    iter = 20_000
    key_len = cipher.key_len
    digest = OpenSSL::Digest.new('SHA256')

    OpenSSL::PKCS5.pbkdf2_hmac(pwd, salt, iter, key_len, digest)
  end

  ##
  # Generates a Radom Base64 Password based on User Requested Length
  ##
  def self.gen_password(length)
    rand_password = SecureRandom.base64(3000)
    puts rand_password[0, length.to_i]
  end
end
