##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Api
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Api < ApiBase
            class V2010 < Version
                class AccountContext < InstanceContext
                class SipList < ListResource
                class DomainContext < InstanceContext
                class AuthTypesList < ListResource
                class AuthTypeCallsList < ListResource

                     class AuthCallsIpAccessControlListMappingList < ListResource
                
                    ##
                    # Initialize the AuthCallsIpAccessControlListMappingList
                    # @param [Version] version Version that contains the resource
                    # @return [AuthCallsIpAccessControlListMappingList] AuthCallsIpAccessControlListMappingList
                    def initialize(version, account_sid: nil, domain_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { account_sid: account_sid, domain_sid: domain_sid }
                        @uri = "/Accounts/#{@solution[:account_sid]}/SIP/Domains/#{@solution[:domain_sid]}/Auth/Calls/IpAccessControlListMappings.json"
                        
                    end
                    ##
                    # Create the AuthCallsIpAccessControlListMappingInstance
                    # @param [String] ip_access_control_list_sid The SID of the IpAccessControlList resource to map to the SIP domain.
                    # @return [AuthCallsIpAccessControlListMappingInstance] Created AuthCallsIpAccessControlListMappingInstance
                    def create(
                        ip_access_control_list_sid: nil
                    )

                        data = Twilio::Values.of({
                            'IpAccessControlListSid' => ip_access_control_list_sid,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        AuthCallsIpAccessControlListMappingInstance.new(
                            @version,
                            payload,
                            account_sid: @solution[:account_sid],
                            domain_sid: @solution[:domain_sid],
                        )
                    end

                
                    ##
                    # Lists AuthCallsIpAccessControlListMappingInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(limit: nil, page_size: nil)
                        self.stream(
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields AuthCallsIpAccessControlListMappingInstance records from the API.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    def each
                        limits = @version.read_limits

                        page = self.page(page_size: limits[:page_size], )

                        @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
                    end

                    ##
                    # Retrieve a single page of AuthCallsIpAccessControlListMappingInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of AuthCallsIpAccessControlListMappingInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        AuthCallsIpAccessControlListMappingPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of AuthCallsIpAccessControlListMappingInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of AuthCallsIpAccessControlListMappingInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    AuthCallsIpAccessControlListMappingPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Api.V2010.AuthCallsIpAccessControlListMappingList>'
                    end
                end


                class AuthCallsIpAccessControlListMappingContext < InstanceContext
                    ##
                    # Initialize the AuthCallsIpAccessControlListMappingContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] account_sid The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the IpAccessControlListMapping resource to fetch.
                    # @param [String] domain_sid The SID of the SIP domain that contains the resource to fetch.
                    # @param [String] sid The Twilio-provided string that uniquely identifies the IpAccessControlListMapping resource to fetch.
                    # @return [AuthCallsIpAccessControlListMappingContext] AuthCallsIpAccessControlListMappingContext
                    def initialize(version, account_sid, domain_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { account_sid: account_sid, domain_sid: domain_sid, sid: sid,  }
                        @uri = "/Accounts/#{@solution[:account_sid]}/SIP/Domains/#{@solution[:domain_sid]}/Auth/Calls/IpAccessControlListMappings/#{@solution[:sid]}.json"

                        
                    end
                    ##
                    # Delete the AuthCallsIpAccessControlListMappingInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the AuthCallsIpAccessControlListMappingInstance
                    # @return [AuthCallsIpAccessControlListMappingInstance] Fetched AuthCallsIpAccessControlListMappingInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        AuthCallsIpAccessControlListMappingInstance.new(
                            @version,
                            payload,
                            account_sid: @solution[:account_sid],
                            domain_sid: @solution[:domain_sid],
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Api.V2010.AuthCallsIpAccessControlListMappingContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Api.V2010.AuthCallsIpAccessControlListMappingContext #{context}>"
                    end
                end

                class AuthCallsIpAccessControlListMappingPage < Page
                    ##
                    # Initialize the AuthCallsIpAccessControlListMappingPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [AuthCallsIpAccessControlListMappingPage] AuthCallsIpAccessControlListMappingPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of AuthCallsIpAccessControlListMappingInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [AuthCallsIpAccessControlListMappingInstance] AuthCallsIpAccessControlListMappingInstance
                    def get_instance(payload)
                        AuthCallsIpAccessControlListMappingInstance.new(@version, payload, account_sid: @solution[:account_sid], domain_sid: @solution[:domain_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Api.V2010.AuthCallsIpAccessControlListMappingPage>'
                    end
                end
                class AuthCallsIpAccessControlListMappingInstance < InstanceResource
                    ##
                    # Initialize the AuthCallsIpAccessControlListMappingInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this AuthCallsIpAccessControlListMapping
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [AuthCallsIpAccessControlListMappingInstance] AuthCallsIpAccessControlListMappingInstance
                    def initialize(version, payload , account_sid: nil, domain_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                            'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                            'friendly_name' => payload['friendly_name'],
                            'sid' => payload['sid'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'account_sid' => account_sid  ,'domain_sid' => domain_sid  || @properties['domain_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [AuthCallsIpAccessControlListMappingContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = AuthCallsIpAccessControlListMappingContext.new(@version , @params['account_sid'], @params['domain_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the IpAccessControlListMapping resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The string that you assigned to describe the resource.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [String] The unique string that that we created to identify the IpAccessControlListMapping resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # Delete the AuthCallsIpAccessControlListMappingInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the AuthCallsIpAccessControlListMappingInstance
                    # @return [AuthCallsIpAccessControlListMappingInstance] Fetched AuthCallsIpAccessControlListMappingInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Api.V2010.AuthCallsIpAccessControlListMappingInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Api.V2010.AuthCallsIpAccessControlListMappingInstance #{values}>"
                    end
                end

             end
             end
             end
             end
             end
            end
        end
    end
end


