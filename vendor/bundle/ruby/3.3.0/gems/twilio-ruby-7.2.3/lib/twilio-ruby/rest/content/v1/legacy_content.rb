##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Content
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Content < ContentBase
            class V1 < Version
                class LegacyContentList < ListResource
                
                    ##
                    # Initialize the LegacyContentList
                    # @param [Version] version Version that contains the resource
                    # @return [LegacyContentList] LegacyContentList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/LegacyContent"
                        
                    end
                
                    ##
                    # Lists LegacyContentInstance records from the API as a list.
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
                    # When passed a block, yields LegacyContentInstance records from the API.
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
                    # Retrieve a single page of LegacyContentInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of LegacyContentInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        LegacyContentPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of LegacyContentInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of LegacyContentInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    LegacyContentPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Content.V1.LegacyContentList>'
                    end
                end

                class LegacyContentPage < Page
                    ##
                    # Initialize the LegacyContentPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [LegacyContentPage] LegacyContentPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of LegacyContentInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [LegacyContentInstance] LegacyContentInstance
                    def get_instance(payload)
                        LegacyContentInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Content.V1.LegacyContentPage>'
                    end
                end
                class LegacyContentInstance < InstanceResource
                    ##
                    # Initialize the LegacyContentInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this LegacyContent
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [LegacyContentInstance] LegacyContentInstance
                    def initialize(version, payload )
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'friendly_name' => payload['friendly_name'],
                            'language' => payload['language'],
                            'variables' => payload['variables'],
                            'types' => payload['types'],
                            'legacy_template_name' => payload['legacy_template_name'],
                            'legacy_body' => payload['legacy_body'],
                            'url' => payload['url'],
                        }
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
                    # @return [String] The unique string that that we created to identify the Content resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/usage/api/account) that created Content resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] A string name used to describe the Content resource. Not visible to the end recipient.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [String] Two-letter (ISO 639-1) language code (e.g., en) identifying the language the Content resource is in.
                    def language
                        @properties['language']
                    end
                    
                    ##
                    # @return [Hash] Defines the default placeholder values for variables included in the Content resource. e.g. {\"1\": \"Customer_Name\"}.
                    def variables
                        @properties['variables']
                    end
                    
                    ##
                    # @return [Hash] The [Content types](https://www.twilio.com/docs/content-api/content-types-overview) (e.g. twilio/text) for this Content resource.
                    def types
                        @properties['types']
                    end
                    
                    ##
                    # @return [String] The string name of the legacy content template associated with this Content resource, unique across all template names for its account.  Only lowercase letters, numbers and underscores are allowed
                    def legacy_template_name
                        @properties['legacy_template_name']
                    end
                    
                    ##
                    # @return [String] The string body field of the legacy content template associated with this Content resource
                    def legacy_body
                        @properties['legacy_body']
                    end
                    
                    ##
                    # @return [String] The URL of the resource, relative to `https://content.twilio.com`.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Content.V1.LegacyContentInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Content.V1.LegacyContentInstance>"
                    end
                end

            end
        end
    end
end
