class User < ActiveRecord::Base
  attr_accessible :name

  concerning :Programmers do
    module ClassMethods 
      def programmer?
        true
      end
    end
  end

  module Managers 
    extend ActiveSupport::Concern

    module ClassMethods
      def manager?
        true
      end
    end
  end

  include Managers


end
