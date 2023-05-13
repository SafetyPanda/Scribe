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

  ##
  # Prompts user for Password, Doesn't echo.
  ##
  def self.get_password(instruction)    
    cipher = OpenSSL::Cipher.new('AES-256-CBC')
    puts "#{instruction}".bold.red

    pwd = $stdin.noecho(&:gets).chomp

    salt = Base64.decode64('CsIktLdJltDHkpK8ZAeIFA==') #To Be Changed
    iter = 20000
    key_len = cipher.key_len
    digest = OpenSSL::Digest.new('SHA256')

    OpenSSL::PKCS5.pbkdf2_hmac(pwd, salt, iter, key_len, digest)
  end

  ##
  # Generates Password based on user requirements
  ##
  def gen_password(length)
    puts "password" 
  end
end
