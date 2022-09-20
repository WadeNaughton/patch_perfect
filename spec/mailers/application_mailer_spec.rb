require "rails_helper"

describe ApplicationMailer do
  before do
    @user = User.create!(first_name: 'wade', last_name: 'wade', username: "wade", email:"wade@bob.com", password: "test", password_confirmation: "test", password_reset_token: "1234")
    # @mail = ApplicationMailer.with(user: user).forgot_password(user) 
  end
    # it 'renders the subject' do
    #   expect(mail.subject).to eql('Instructions')
    # end

    # it 'renders the receiver email' do
    #   expect(mail.to).to eql([user.email])
    # end

    # it 'renders the sender email' do
    #   expect(mail.from).to eql(['noreply@company.com'])
    # end

    # it 'assigns @name' do
    #   expect(mail.body.encoded).to match(user.name)
    # end

    # it 'assigns @confirmation_url' do
    #   expect(mail.body.encoded).to match("http://aplication_url/#{user.id}/confirmation")
    # end
# it 'renders the subject' do
#     expect { 
#       ApplicationMailer.forgot_password(@user).deliver_now
#     }.to( 
#       have_enqueued_job.on_queue('mailers').with(
#         # `with` isn't mandatory, but it will help if you want to make sure is
#         # the correct enqueued mail.
#         'ApplicationMailer', 'forgot_password', 'deliver_now'
#       )
#     )
#   end

it 'should send an email' do
  ApplicationMailer.forgot_password(@user).deliver_now

  expect(ActionMailer::Base.deliveries.count).to eq(1)
end

  it 'should set the subject to the correct subject' do
    ApplicationMailer.forgot_password(@user).deliver_now
   expect( ActionMailer::Base.deliveries.first.subject).to eq('Reset password instructions') 
  
  end

  it 'renders the sender email' do  
    ApplicationMailer.forgot_password(@user).deliver_now
    expect(ActionMailer::Base.deliveries.first.from).to  eq(["wadenaughton@gmail.com"])
  end


end