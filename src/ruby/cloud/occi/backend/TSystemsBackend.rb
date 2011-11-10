##############################################################################
#  Copyright 2011 Terradue srl
#  
#  Licensed under the Apache License, Version 2.0 (the "License" );
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#  
#      http://www.apache.org/licenses/LICENSE-2.0
#  
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
##############################################################################

require 'occi/ActionDelegator'
require 'occi/infrastructure/Compute'
require 'rest_client'
require 'xml'

module OCCI
  module Backend
    class TSystemsBackend
      
      def initialize()
        client = RestClient::Resource.new( 'https://testcloud.t-systems.com' )
        
        # Register methods for actions
        delegator = OCCI::ActionDelegator.instance
        delegator.register_method_for_action(OCCI::Infrastructure::Compute::ACTION_START, self, :compute_start)
        delegator.register_method_for_action(OCCI::Infrastructure::Compute::ACTION_STOP,  self, :compute_stop)
      end     
      
      def compute_start(action, parameters, resource)
        $log.debug( "compute_start: action [#{action}] with parameters [#{parameters}] called for resource [#{resource}]!" )
        
        response = client['/ZimoryManage/services/api/'].post '<TDB/>', :content_type => 'text/xml'
      end
      
      def compute_stop(action, parameters, resource)
        $log.debug( "compute_stop: action [#{action}] with parameters [#{parameters}] called for resource [#{resource}]!" )
      end
      
      def create_compute_instance(computeObject)
        $log.debug( "create_compute_instance: computeObject [#{computeObject}]!" )
      end
      
      def delete_compute_instance(computeObject)
        $log.debug( "delete_compute_instance: computeObject [#{computeObject}]!" )
      end
      
      def create_network_instance(networkObject)
        $log.debug( "create_network_instance: computeObject [#{networkObject}]!" )
      end
      
      def delete_network_instance(networkObject)
        $log.debug( "delete_network_instance: computeObject [#{networkObject}]!" )
      end
      
      def create_storage_instance(storageObject)
        $log.debug( "create_storage_instance: storageObject [#{storageObject}]!" )
      end
      
      def delete_storage_instance(storageObject)
        $log.debug( "delete_storage_instance: storageObject [#{storageObject}]!" )
      end
      
      def get_all_vnet_ids
        begin
          response = client['/ZimoryManage/services/api/networks'].get
          
          if ( 200 != response.code )
          {
            $log.error( "[get_all_vnet_ids] t-systems REST service replied an invalid code: #{response.code}" )
            return []
          }
          
          parser, parser.string = XML::Parser.new, response.to_str
          doc, ids = parser.parse, []
          doc.find( '/￼apNetworks/network/networkId' ).each do |n|
            ids << n.content
          end

          return ids
        rescue => e
          $log.error( "[get_all_vnet_ids] An error occurred while invoking the REST service: #{e}" )
          return []
        end
      end
      
      def get_all_image_ids
        begin
          response = client['/ZimoryManage/services/api/deployments'].get
          
          if ( 200 != response.code )
          {
            $log.error( "[get_all_image_ids] t-systems REST service replied an invalid code: #{response.code}" )
            return []
          }
          
          parser, parser.string = XML::Parser.new, response.to_str
          doc, ids = parser.parse, []
          doc.find( '/deployments/deployment/@id' ).each do |id|
            ids << id.content
          end

          return ids
        rescue => e
          $log.error( "[get_all_image_ids] An error occurred while while invoking the REST service: #{e}" )
          return []
        end
      end
      
      def print_configuration()
      end
      
    end
  end  
end
