# encoding: utf-8

require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))
require 'data_objects/spec/typecast/nil_spec'

describe 'DataObjects::Derby with Nil' do
  it_should_behave_like 'supporting Nil'
  it_should_behave_like 'supporting Nil autocasting'
end
