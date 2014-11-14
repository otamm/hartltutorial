require "spec_helper"

describe "user model" do
  before do
    @user = User.create(name: "aaaaaa", email: "aaaa@aaaa.com")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  describe "name not present" do
    before { @user.name = nil }
    it {should_not be_valid}
  end

  describe "name too long" do
    before { @user.name = "a" * 20 }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. example@mr..loll
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

  describe "when email is repeated" do
    it "should not be valid" do
      user_with_same_email = User.new(name: "aaaaaa",email: "aaaa@aaaa.com")
      user_with_same_email.save
      expect(user_with_same_email).not_to be_valid
    end
  end
end
