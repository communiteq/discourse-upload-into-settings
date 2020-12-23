# name: discourse-upload-into-settings
# about: allow uploading files into settings of type "upload"
# version: 1.0
# authors: richard@communiteq.com
# url: https://github.com/discoursehosting/discourse-upload-into-settings

enabled_site_setting :upload_into_settings_enabled

after_initialize do
  module ::SiteSettingExtension

    alias_method :old_set_and_log, :set_and_log

    def set_and_log(name, value, user = Discourse.system_user)
      if SiteSetting.upload_into_settings_enabled && has_setting?(name) && (type_supervisor.get_type(name) == :upload) && (value.class == String)
        filename = File.basename(value.split('?')[0])
        if value.starts_with?('http')
          extension = File.extname(filename)
          tmp = Tempfile.new(['discourse-upload', extension])
          tmp.binmode
          case io = URI.open(value, 'rb')
            when StringIO then tmp.write(io.read); tmp.close
            when Tempfile then io.close; tmp.close; FileUtils.mv(io.path, tmp.path)
          end
          value = tmp.path
        end
        value = UploadCreator.new(File.open(value, 'rb'), filename).create_for(user.id)
      end

      old_set_and_log(name, value, user)
    end
  end
end
