# frozen_string_literal: true

RSpec.describe Alphanso do
  it "has a version number" do
    expect(Alphanso::VERSION).not_to be nil
  end

  context "Standard Plan" do
    it "should return deletion date after 42 days" do
      date = Date.parse("2010-01-03")
      deletion_date = Alphanso::RetentionPolicy.deletion_date("Standard", date)
      expect(deletion_date).to eq(date.next_day(42))
    end

    it "should return deletion date after 42 days for snap created at the end of month" do
      date = Date.parse("2010-01-31")
      deletion_date = Alphanso::RetentionPolicy.deletion_date("Standard", date)
      expect(deletion_date).to eq(date.next_day(42))
    end

    it "should return deletion date after 42 days for snap created at the end of year" do
      date = Date.parse("2010-12-31")
      deletion_date = Alphanso::RetentionPolicy.deletion_date("Standard", date)
      expect(deletion_date).to eq(date.next_day(42))
    end
  end

  context "Gold Plan" do
    it "should return deletion date after 42 days" do
      date = Date.parse("2010-01-03")
      deletion_date = Alphanso::RetentionPolicy.deletion_date("Gold", date)
      expect(deletion_date).to eq(date.next_day(42))
    end

    it "should return deletion date after 12 months for snap created at the end of month" do
      date = Date.parse("2010-01-31")
      deletion_date = Alphanso::RetentionPolicy.deletion_date("Gold", date)
      expect(deletion_date).to eq(date.next_day(365))
    end

    it "should return deletion date after 12 months for snap created at the end of year" do
      date = Date.parse("2010-12-31")
      deletion_date = Alphanso::RetentionPolicy.deletion_date("Gold", date)
      expect(deletion_date).to eq(date.next_day(365))
    end
  end

  context "Platinum Plan" do
    it "should return deletion date after 42 days" do
      date = Date.parse("2010-01-03")
      deletion_date = Alphanso::RetentionPolicy.deletion_date("Platinum", date)
      expect(deletion_date).to eq(date.next_day(42))
    end

    it "should return deletion date after 12 months for snap created at the end of month" do
      date = Date.parse("2010-01-31")
      deletion_date = Alphanso::RetentionPolicy.deletion_date("Platinum", date)
      expect(deletion_date).to eq(date.next_day(365))
    end

    it "should return deletion date after 7 years for snap created at the end of year" do
      date = Date.parse("2010-12-31")
      deletion_date = Alphanso::RetentionPolicy.deletion_date("Platinum", date)
      expect(deletion_date).to eq(date.next_day(2555))
    end
  end

  context "Invalid Plan" do
    it "should raise error for invalid plan" do
      date = Date.parse("2010-01-03")
      expect { Alphanso::RetentionPolicy.deletion_date("SuperGold", date) }.to raise_error(RuntimeError)
    end
  end
end
