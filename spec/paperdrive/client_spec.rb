# frozen_string_literal: true

RSpec.describe Paperdrive::Client do
 describe 'initializer' do
   context 'ENV is not set' do
     it 'raise error if no args is passed' do
       expect { described_class.new }.to raise_error(Paperdrive::AuthTokenNotSpecified )
     end
   end

   context 'ENV is set' do
     around do |example|
       ENV['PAPERDRIVE_TOKEN'] = 'pipedriveapitoken'
       example.run
       ENV['PAPERDRIVE_TOKEN'] = nil
     end
     it 'not raise error if token is passed by args' do
       expect { described_class.new }.not_to raise_error(Paperdrive::AuthTokenNotSpecified )
     end
   end
 end
end
