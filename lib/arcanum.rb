#
# Arcanum Module
# Ruby "Wrapper" for CryFS CLI Commands to create, mount, and delete CryFS Folders
# I honestly don't know why I made this a module, but it's here now.
#

require 'open3'
require 'fileutils'

module Arcanum
    def self.mount_secure_folder(folder_path)
        cmd = 'cryfs ' + folder_path + ' ' + folder_path + '_arcanum'
        system(cmd)
    end

    def self.unmount_secure_folder(folder_path)
        cmd = 'cryfs-unmount ' + folder_path + '_arcanum'
        system(cmd)
    end

    def self.destroy_arcanum(folder_path)
        #Ensure the Folder has been unmounted
        Arcanum.unmount_secure_folder(folder_path)

        FileUtils.rm_rf(folder_path + '_arcanum')
        FileUtils.rm_rf("#{folder_path}")
    end
end
