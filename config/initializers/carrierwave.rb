CarrierWave.configure do |config|
	config.fog_credentials = {
		provider: 'AWS',
		aws_access_key_id: 'AKIAJUKJOU3ZAQR2P7UA',
		aws_secret_access_key: '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',
		region: 'us-east-2'
	}
	config.fog_directory = 'trainr'
end
