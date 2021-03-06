# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

module Elasticsearch
  module API
    module Indices
      module Actions
        # Clears all or specific caches for one or more indices.
        #
        # @option arguments [List] :index A comma-separated list of index name to limit the operation
        # @option arguments [Boolean] :fielddata Clear field data
        # @option arguments [List] :fields A comma-separated list of fields to clear when using the `fielddata` parameter (default: all)
        # @option arguments [Boolean] :query Clear query caches
        # @option arguments [Boolean] :ignore_unavailable Whether specified concrete indices should be ignored when unavailable (missing or closed)
        # @option arguments [Boolean] :allow_no_indices Whether to ignore if a wildcard indices expression resolves into no concrete indices. (This includes `_all` string or when no indices have been specified)
        # @option arguments [String] :expand_wildcards Whether to expand wildcard expression to concrete indices that are open, closed or both.
        #   (options: open,closed,none,all)

        # @option arguments [List] :index A comma-separated list of index name to limit the operation
        # @option arguments [Boolean] :request Clear request cache

        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/7.5/indices-clearcache.html
        #
        def clear_cache(arguments = {})
          arguments = arguments.clone

          _index = arguments.delete(:index)

          method = Elasticsearch::API::HTTP_POST
          path   = if _index
                     "#{Utils.__listify(_index)}/_cache/clear"
                   else
                     "_cache/clear"
end
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

          body = nil
          perform_request(method, path, params, body).body
        end

        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:clear_cache, [
          :fielddata,
          :fields,
          :query,
          :ignore_unavailable,
          :allow_no_indices,
          :expand_wildcards,
          :index,
          :request
        ].freeze)
end
      end
  end
end
