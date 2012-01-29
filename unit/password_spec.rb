require File.join(File.dirname(__FILE__), "spec_helper")

require 'password'

describe "A", Password do
    describe "that contains all required character types" do
        it "is valid if it is between 6 and 16 characters long" do
            password = Password.new 'aValidP@ssw0rd'
            password.valid?.should == true
        end

        it "is valid if it is exactly 6 characters long" do
            password = Password.new 'p@55wd'
            password.valid?.should == true
        end

        it "is valid if is is exactly 16 characters long" do
            password = Password.new 'a16CharP@sswordx'
            password.valid?.should == true
        end

        it "is invalid if it is shorter than 6 characters" do
            password = Password.new 'p@55w'
            password.valid?.should == false
        end

        it "is invalid if is is longer than 16 characters" do
            password = Password.new 'a17CharP@sswordxx'
            password.valid?.should == false
        end
    end

    describe "with a valid length" do
        it "is invalid if it contains no letters" do
            password = Password.new '1234%$#{@}'
            password.valid?.should == false
        end

        it "is invalid if is contains no digits" do
            password = Password.new 'abcd!@()'
            password.valid?.should == false
        end

        it "is invalid if it contains no punctuation" do
            password = Password.new 'abcd1234'
            password.valid?.should == false
        end

        it "is valid if it contains letters, digits, and punctuation" do
            password = Password.new 'aValidP@ssw0rd'
            password.valid?.should == true
        end
    end
end
