require 'spec_helper'

describe Inquiry do
  let(:blanks){[nil, '']}

  it { should have_valid(:first_name).when('Bob', 'Kevin') }
  it { should have_valid(:last_name).when('Lob', 'Kwon') }
  it { should have_valid(:subject).when('Awesome', 'Wanted to let you know..') }
  it { should have_valid(:description).when('Awesome job you guys! I love it!', 'Wanted to let you all know that you are the best in the business.') }

  it { should_not have_valid(:first_name).when(*blanks) }
  it { should_not have_valid(:last_name).when(*blanks) }
  it { should_not have_valid(:subject).when(*blanks) }
  it { should_not have_valid(:description).when(*blanks) }


  let(:invalid_emails){['user@mycom', 'hello', '.com', 'user.com']}
  it { should have_valid(:email).when('kevin@gmail.com', 'kevin@lalalalala.com', 'faiz_aan_89@wizard.com') }
  it { should_not have_valid(:email).when(*invalid_emails) }
end
