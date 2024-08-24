##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Intelligence
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Intelligence < IntelligenceBase
            class V2 < Version
                class ServiceList < ListResource
                
                    ##
                    # Initialize the ServiceList
                    # @param [Version] version Version that contains the resource
                    # @return [ServiceList] ServiceList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Services"
                        
                    end
                    ##
                    # Create the ServiceInstance
                    # @param [String] unique_name Provides a unique and addressable name to be assigned to this Service, assigned by the developer, to be optionally used in addition to SID.
                    # @param [Boolean] auto_transcribe Instructs the Speech Recognition service to automatically transcribe all recordings made on the account.
                    # @param [Boolean] data_logging Data logging allows Twilio to improve the quality of the speech recognition & language understanding services through using customer data to refine, fine tune and evaluate machine learning models. Note: Data logging cannot be activated via API, only via www.twilio.com, as it requires additional consent.
                    # @param [String] friendly_name A human readable description of this resource, up to 64 characters.
                    # @param [String] language_code The language code set during Service creation determines the Transcription language for all call recordings processed by that Service. The default is en-US if no language code is set. A Service can only support one language code, and it cannot be updated once it's set.
                    # @param [Boolean] auto_redaction Instructs the Speech Recognition service to automatically redact PII from all transcripts made on this service.
                    # @param [Boolean] media_redaction Instructs the Speech Recognition service to automatically redact PII from all transcripts media made on this service. The auto_redaction flag must be enabled, results in error otherwise.
                    # @param [String] webhook_url The URL Twilio will request when executing the Webhook.
                    # @param [HttpMethod] webhook_http_method 
                    # @return [ServiceInstance] Created ServiceInstance
                    def create(
                        unique_name: nil, 
                        auto_transcribe: :unset, 
                        data_logging: :unset, 
                        friendly_name: :unset, 
                        language_code: :unset, 
                        auto_redaction: :unset, 
                        media_redaction: :unset, 
                        webhook_url: :unset, 
                        webhook_http_method: :unset
                    )

                        data = Twilio::Values.of({
                            'UniqueName' => unique_name,
                            'AutoTranscribe' => auto_transcribe,
                            'DataLogging' => data_logging,
                            'FriendlyName' => friendly_name,
                            'LanguageCode' => language_code,
                            'AutoRedaction' => auto_redaction,
                            'MediaRedaction' => media_redaction,
                            'WebhookUrl' => webhook_url,
                            'WebhookHttpMethod' => webhook_http_method,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        ServiceInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists ServiceInstance records from the API as a list.
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
                    # When passed a block, yields ServiceInstance records from the API.
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
                    # Retrieve a single page of ServiceInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of ServiceInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        ServicePage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of ServiceInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of ServiceInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    ServicePage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Intelligence.V2.ServiceList>'
                    end
                end


                class ServiceContext < InstanceContext
                    ##
                    # Initialize the ServiceContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid A 34 character string that uniquely identifies this Service.
                    # @return [ServiceContext] ServiceContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/Services/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Delete the ServiceInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the ServiceInstance
                    # @return [ServiceInstance] Fetched ServiceInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        ServiceInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the ServiceInstance
                    # @param [Boolean] auto_transcribe Instructs the Speech Recognition service to automatically transcribe all recordings made on the account.
                    # @param [Boolean] data_logging Data logging allows Twilio to improve the quality of the speech recognition & language understanding services through using customer data to refine, fine tune and evaluate machine learning models. Note: Data logging cannot be activated via API, only via www.twilio.com, as it requires additional consent.
                    # @param [String] friendly_name A human readable description of this resource, up to 64 characters.
                    # @param [String] unique_name Provides a unique and addressable name to be assigned to this Service, assigned by the developer, to be optionally used in addition to SID.
                    # @param [Boolean] auto_redaction Instructs the Speech Recognition service to automatically redact PII from all transcripts made on this service.
                    # @param [Boolean] media_redaction Instructs the Speech Recognition service to automatically redact PII from all transcripts media made on this service. The auto_redaction flag must be enabled, results in error otherwise.
                    # @param [String] webhook_url The URL Twilio will request when executing the Webhook.
                    # @param [HttpMethod] webhook_http_method 
                    # @param [String] if_match The If-Match HTTP request header
                    # @return [ServiceInstance] Updated ServiceInstance
                    def update(
                        auto_transcribe: :unset, 
                        data_logging: :unset, 
                        friendly_name: :unset, 
                        unique_name: :unset, 
                        auto_redaction: :unset, 
                        media_redaction: :unset, 
                        webhook_url: :unset, 
                        webhook_http_method: :unset, 
                        if_match: :unset
                    )

                        data = Twilio::Values.of({
                            'AutoTranscribe' => auto_transcribe,
                            'DataLogging' => data_logging,
                            'FriendlyName' => friendly_name,
                            'UniqueName' => unique_name,
                            'AutoRedaction' => auto_redaction,
                            'MediaRedaction' => media_redaction,
                            'WebhookUrl' => webhook_url,
                            'WebhookHttpMethod' => webhook_http_method,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', 'If-Match' => if_match, })
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        ServiceInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Intelligence.V2.ServiceContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Intelligence.V2.ServiceContext #{context}>"
                    end
                end

                class ServicePage < Page
                    ##
                    # Initialize the ServicePage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [ServicePage] ServicePage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of ServiceInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [ServiceInstance] ServiceInstance
                    def get_instance(payload)
                        ServiceInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Intelligence.V2.ServicePage>'
                    end
                end
                class ServiceInstance < InstanceResource
                    ##
                    # Initialize the ServiceInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Service
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [ServiceInstance] ServiceInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'auto_redaction' => payload['auto_redaction'],
                            'media_redaction' => payload['media_redaction'],
                            'auto_transcribe' => payload['auto_transcribe'],
                            'data_logging' => payload['data_logging'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'friendly_name' => payload['friendly_name'],
                            'language_code' => payload['language_code'],
                            'sid' => payload['sid'],
                            'unique_name' => payload['unique_name'],
                            'url' => payload['url'],
                            'webhook_url' => payload['webhook_url'],
                            'webhook_http_method' => payload['webhook_http_method'],
                            'read_only_attached_operator_sids' => payload['read_only_attached_operator_sids'],
                            'version' => payload['version'] == nil ? payload['version'] : payload['version'].to_i,
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [ServiceContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = ServiceContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique SID identifier of the Account the Service belongs to.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [Boolean] Instructs the Speech Recognition service to automatically redact PII from all transcripts made on this service.
                    def auto_redaction
                        @properties['auto_redaction']
                    end
                    
                    ##
                    # @return [Boolean] Instructs the Speech Recognition service to automatically redact PII from all transcripts media made on this service. The auto_redaction flag must be enabled, results in error otherwise.
                    def media_redaction
                        @properties['media_redaction']
                    end
                    
                    ##
                    # @return [Boolean] Instructs the Speech Recognition service to automatically transcribe all recordings made on the account.
                    def auto_transcribe
                        @properties['auto_transcribe']
                    end
                    
                    ##
                    # @return [Boolean] Data logging allows Twilio to improve the quality of the speech recognition & language understanding services through using customer data to refine, fine tune and evaluate machine learning models. Note: Data logging cannot be activated via API, only via www.twilio.com, as it requires additional consent.
                    def data_logging
                        @properties['data_logging']
                    end
                    
                    ##
                    # @return [Time] The date that this Service was created, given in ISO 8601 format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date that this Service was updated, given in ISO 8601 format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] A human readable description of this resource, up to 64 characters.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [String] The language code set during Service creation determines the Transcription language for all call recordings processed by that Service. The default is en-US if no language code is set. A Service can only support one language code, and it cannot be updated once it's set.
                    def language_code
                        @properties['language_code']
                    end
                    
                    ##
                    # @return [String] A 34 character string that uniquely identifies this Service.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] Provides a unique and addressable name to be assigned to this Service, assigned by the developer, to be optionally used in addition to SID.
                    def unique_name
                        @properties['unique_name']
                    end
                    
                    ##
                    # @return [String] The URL of this resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [String] The URL Twilio will request when executing the Webhook.
                    def webhook_url
                        @properties['webhook_url']
                    end
                    
                    ##
                    # @return [HttpMethod] 
                    def webhook_http_method
                        @properties['webhook_http_method']
                    end
                    
                    ##
                    # @return [Array<String>] Operator sids attached to this service, read only
                    def read_only_attached_operator_sids
                        @properties['read_only_attached_operator_sids']
                    end
                    
                    ##
                    # @return [String] The version number of this Service.
                    def version
                        @properties['version']
                    end
                    
                    ##
                    # Delete the ServiceInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the ServiceInstance
                    # @return [ServiceInstance] Fetched ServiceInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the ServiceInstance
                    # @param [Boolean] auto_transcribe Instructs the Speech Recognition service to automatically transcribe all recordings made on the account.
                    # @param [Boolean] data_logging Data logging allows Twilio to improve the quality of the speech recognition & language understanding services through using customer data to refine, fine tune and evaluate machine learning models. Note: Data logging cannot be activated via API, only via www.twilio.com, as it requires additional consent.
                    # @param [String] friendly_name A human readable description of this resource, up to 64 characters.
                    # @param [String] unique_name Provides a unique and addressable name to be assigned to this Service, assigned by the developer, to be optionally used in addition to SID.
                    # @param [Boolean] auto_redaction Instructs the Speech Recognition service to automatically redact PII from all transcripts made on this service.
                    # @param [Boolean] media_redaction Instructs the Speech Recognition service to automatically redact PII from all transcripts media made on this service. The auto_redaction flag must be enabled, results in error otherwise.
                    # @param [String] webhook_url The URL Twilio will request when executing the Webhook.
                    # @param [HttpMethod] webhook_http_method 
                    # @param [String] if_match The If-Match HTTP request header
                    # @return [ServiceInstance] Updated ServiceInstance
                    def update(
                        auto_transcribe: :unset, 
                        data_logging: :unset, 
                        friendly_name: :unset, 
                        unique_name: :unset, 
                        auto_redaction: :unset, 
                        media_redaction: :unset, 
                        webhook_url: :unset, 
                        webhook_http_method: :unset, 
                        if_match: :unset
                    )

                        context.update(
                            auto_transcribe: auto_transcribe, 
                            data_logging: data_logging, 
                            friendly_name: friendly_name, 
                            unique_name: unique_name, 
                            auto_redaction: auto_redaction, 
                            media_redaction: media_redaction, 
                            webhook_url: webhook_url, 
                            webhook_http_method: webhook_http_method, 
                            if_match: if_match, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Intelligence.V2.ServiceInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Intelligence.V2.ServiceInstance #{values}>"
                    end
                end

            end
        end
    end
end
