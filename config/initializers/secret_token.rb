# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

#TutorialDemo::Application.config.secret_key_base = '3a196275720d6a0214135b7f910819206d1f5c8027adeb2e92d73abc95edb5619215182fbc5310083129b215f41b01b1330d2f64976f0ccf67a027cfc4823568'
#
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    File.read(token_file).chomp
  else
    token = SecureRandom.hex(64)
    File.write(token_file,token)
    token
  end
end

TutorialDemo::Application.config.secret_key_base = secure_token

