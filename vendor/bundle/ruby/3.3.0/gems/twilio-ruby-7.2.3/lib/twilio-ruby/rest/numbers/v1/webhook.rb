##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Numbers
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Numbers < NumbersBase
            class V1 < Version
                class WebhookList < ListResource
                
                    ##
                    # Initialize the WebhookList
                    # @param [Version] version Version that contains the resource
                    # @return [WebhookList] WebhookList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Porting/Configuration/Webhook"
                        
                    end
                    ##
                    # Fetch the WebhookInstance
                    # @return [WebhookInstance] Fetched WebhookInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        WebhookInstance.new(
                            @version,
                            payload,
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Numbers.V1.WebhookList>'
                    end
                end

                class WebhookPage < Page
                    ##
                    # Initialize the WebhookPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [WebhookPage] WebhookPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of WebhookInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [WebhookInstance] WebhookInstance
                    def get_instance(payload)
                        WebhookInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Numbers.V1.WebhookPage>'
                    end
                end
                class WebhookInstance < InstanceResource
                    ##
                    # Initialize the WebhookInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Webhook
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [WebhookInstance] WebhookInstance
                    def initialize(version, payload )
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'url' => payload['url'],
                            'port_in_target_url' => payload['port_in_target_url'],
                            'port_out_target_url' => payload['port_out_target_url'],
                            'notifications_of' => payload['notifications_of'],
                            'port_in_target_date_created' => Twilio.deserialize_iso8601_datetime(payload['port_in_target_date_created']),
                            'port_out_target_date_created' => Twilio.deserialize_iso8601_datetime(payload['port_out_target_date_created']),
                        }
                    end

                    
                    ##
                    # @return [String] The URL of the webhook configuration request
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [String] Webhook URL to send a request when a port in request or port in phone number event happens
                    def port_in_target_url
                        @properties['port_in_target_url']
                    end
                    
                    ##
                    # @return [String] Webhook URL to send a request when a port out phone number event happens
                    def port_out_target_url
                        @properties['port_out_target_url']
                    end
                    
                    ##
                    # @return [Array<String>] List of notification events to send a request to the webhook URL
                    def notifications_of
                        @properties['notifications_of']
                    end
                    
                    ##
                    # @return [Time] Creation date for the port in webhook configuration
                    def port_in_target_date_created
                        @properties['port_in_target_date_created']
                    end
                    
                    ##
                    # @return [Time] Creation date for the port out webhook configuration
                    def port_out_target_date_created
                        @properties['port_out_target_date_created']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Numbers.V1.WebhookInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Numbers.V1.WebhookInstance>"
                    end
                end

            end
        end
    end
end
