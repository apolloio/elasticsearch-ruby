# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module XPack
    module API
      module IndexLifecycleManagement
        module Actions
          # TODO: Description

          #
          # @option arguments [String] :index The name of the index whose lifecycle step is to change

          # @option arguments [Hash] :body The new lifecycle step to move to
          #
          # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/ilm-move-to-step.html
          #
          def move_to_step(arguments = {})
            raise ArgumentError, "Required argument 'index' missing" unless arguments[:index]

            arguments = arguments.clone

            _index = arguments.delete(:index)

            method = Elasticsearch::API::HTTP_POST
            path   = "_ilm/move/#{Elasticsearch::API::Utils.__listify(_index)}"
            params = {}

            body = arguments[:body]
            perform_request(method, path, params, body).body
          end
      end
    end
    end
  end
end
