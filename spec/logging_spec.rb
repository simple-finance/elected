require 'spec_helper'

module Elected
  class LogTester

    include Logging

    def dbg
      debug 'debugging ...'
    end

    def inf
      info 'infoing ....'
    end

    def wrn
      warn 'warning ...'
    end

    def err
      error 'erroring ...'
    end

    class << self

      def dbg
        debug 'debugging ...'
      end

      def inf
        info 'infoing ....'
      end

      def wrn
        warn 'warning ...'
      end

      def err
        error 'erroring ...'
      end

    end

  end

  describe Logging, logging: true do

    subject { LogTester.new }

    context 'instance' do
      it('debug  ') { expect_instance_log_msg :dbg, 'debugging ...' }
      it('info   ') { expect_instance_log_msg :inf, 'infoing ...' }
      it('warning') { expect_instance_log_msg :wrn, 'warning ...' }
      it('error  ') { expect_instance_log_msg :err, 'erroring ...' }
    end

    context 'class' do
      it('debug  ') { expect_class_log_msg :dbg, 'debugging ...' }
      it('info   ') { expect_class_log_msg :inf, 'infoing ...' }
      it('warning') { expect_class_log_msg :wrn, 'warning ...' }
      it('error  ') { expect_class_log_msg :err, 'erroring ...' }
    end

  end
end
