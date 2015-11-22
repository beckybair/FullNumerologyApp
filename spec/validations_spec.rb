require 'spec_helper'

describe "Our Person Validation Methods" do
  include SpecHelper

  before (:all) do
    @existing_person = Person.create(first_name: "Miss", last_name: "Piggy", birthdate: DateTime.now - 40.years )
  end
  
  after (:all) do
    if !@existing_person.destroyed?
      @existing_person.delete
    end
  end

  it 'prevents a person from being added without a first_name' do
    person = Person.create(last_name: "Bear", birthdate: '1975-01-01')
    expect(person.id == nil).to be(true)
  end
  
  it 'prevents a person from being updated without a first_name' do
    @existing_person.first_name = nil
    expect(@existing_person.save).to be(false)
  end
  
  it 'prevents a person from being added without a last_name' do
    person = Person.create(first_name: "Fozzie", birthdate: '1975-01-01')
    expect(person.id == nil).to be(true)
  end
  
  it 'prevents a person from being updated without a last_name' do
    @existing_person.last_name = nil
    expect(@existing_person.save).to be(false)
  end
  
  it 'prevents a person from being added without a birthdate' do
    person = Person.create(first_name: "Fozzie", last_name: 'TheBear')
    expect(person.id == nil).to be(true)
  end
  
  it 'prevents a person from being updated without a birthdate' do
    @existing_person.birthdate = nil
    expect(@existing_person.save).to be(false)
  end  
end