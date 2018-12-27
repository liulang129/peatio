# encoding: UTF-8
# frozen_string_literal: true

module BlockchainClient
    class Grin < Base
      def initialize(*)
        super
        @json_rpc_call_id  = 0
        @json_rpc_endpoint = URI.parse(blockchain.server)
      end
    end
end