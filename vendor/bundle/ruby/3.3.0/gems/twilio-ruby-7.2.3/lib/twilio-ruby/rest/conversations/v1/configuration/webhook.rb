##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Conversations
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Conversations < ConversationsBase
            class V1 < Version
                class ConfigurationContext < InstanceContext

                     class WebhookList < ListResource
                
                    ##
                    # Initialize the WebhookList
                    # @param [Version] version Version that contains the resource
                    # @return [WebhookList] WebhookList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        
                        
                    end
                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Conversations.V1.WebhookList>'
                    end
                end


                class WebhookContext < InstanceContext
                    ##
                    # Initialize the WebhookContext
                    # @param [Version] version Version that contains the resource
                    # @return [WebhookContext] WebhookContext
                    def initialize(version)
                        super(version)

                        # Path Solution
                        @solution = {  }
                        @uri = "/Configuration/Webhooks"

                        
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

                    ##
                    # Update the WebhookInstance
                    # @param [String] method The HTTP method to be used when sending a webhook request.
                    # @param [Array[String]] filters The list of webhook event triggers that are enabled for this Service: `onMessageAdded`, `onMessageUpdated`, `onMessageRemoved`, `onConversationUpdated`, `onConversationRemoved`, `onParticipantAdded`, `onParticipantUpdated`, `onParticipantRemoved`
                    # @param [String] pre_webhook_url The absolute url the pre-event webhook request should be sent to.
                    # @param [String] post_webhook_url The absolute url the post-event webhook request should be sent to.
                    # @param [Target] target 
                    # @return [WebhookInstance] Updated WebhookInstance
                    def update(
                        method: :unset, 
                        filters: :unset, 
                        pre_webhook_url: :unset, 
                        post_webhook_url: :unset, 
                        target: :unset
                    )

                        data = Twilio::Values.of({
                            'Method' => method,
                            'Filters' => Twilio.serialize_list(filters) { |e| e },
                            'PreWebhookUrl' => pre_webhook_url,
                            'PostWebhookUrl' => post_webhook_url,
                            'Target' => target,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        WebhookInstance.new(
                            @version,
                            payload,
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Conversations.V1.WebhookContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Conversations.V1.WebhookContext #{context}>"
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
                        '<Twilio.Conversations.V1.WebhookPage>'
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
                            'account_sid' => payload['account_sid'],
                            'method' => payload['method'],
                            'filters' => payload['filters'],
                            'pre_webhook_url' => payload['pre_webhook_url'],
                            'post_webhook_url' => payload['post_webhook_url'],
                            'target' => payload['target'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = {  }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [WebhookContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = WebhookContext.new(@version )
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique ID of the [Account](https://www.twilio.com/docs/iam/api/account) responsible for this conversation.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [Method] 
                    def method
                        @properties['method']
                    end
                    
                    ##
                    # @return [Array<String>] The list of webhook event triggers that are enabled for this Service: `onMessageAdded`, `onMessageUpdated`, `onMessageRemoved`, `onConversationUpdated`, `onConversationRemoved`, `onParticipantAdded`, `onParticipantUpdated`, `onParticipantRemoved`
                    def filters
                        @properties['filters']
                    end
                    
                    ##
                    # @return [String] The absolute url the pre-event webhook request should be sent to.
                    def pre_webhook_url
                        @properties['pre_webhook_url']
                    end
                    
                    ##
                    # @return [String] The absolute url the post-event webhook request should be sent to.
                    def post_webhook_url
                        @properties['post_webhook_url']
                    end
                    
                    ##
                    # @return [Target] 
                    def target
                        @properties['target']
                    end
                    
                    ##
                    # @return [String] An absolute API resource API resource URL for this webhook.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Fetch the WebhookInstance
                    # @return [WebhookInstance] Fetched WebhookInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the WebhookInstance
                    # @param [String] method The HTTP method to be used when sending a webhook request.
                    # @param [Array[String]] filters The list of webhook event triggers that are enabled for this Service: `onMessageAdded`, `onMessageUpdated`, `onMessageRemoved`, `onConversationUpdated`, `onConversationRemoved`, `onParticipantAdded`, `onParticipantUpdated`, `onParticipantRemoved`
                    # @param [String] pre_webhook_url The absolute url the pre-event webhook request should be sent to.
                    # @param [String] post_webhook_url The absolute url the post-event webhook request should be sent to.
                    # @param [Target] target 
                    # @return [WebhookInstance] Updated WebhookInstance
                    def update(
                        method: :unset, 
                        filters: :unset, 
                        pre_webhook_url: :unset, 
                        post_webhook_url: :unset, 
                        target: :unset
                    )

                        context.update(
                            method: method, 
                            filters: filters, 
                            pre_webhook_url: pre_webhook_url, 
                            post_webhook_url: post_webhook_url, 
                            target: target, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Conversations.V1.WebhookInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Conversations.V1.WebhookInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end


