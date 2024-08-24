##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Video
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Video < VideoBase
            class V1 < Version
                class RoomContext < InstanceContext

                     class RecordingRulesList < ListResource
                
                    ##
                    # Initialize the RecordingRulesList
                    # @param [Version] version Version that contains the resource
                    # @return [RecordingRulesList] RecordingRulesList
                    def initialize(version, room_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { room_sid: room_sid }
                        @uri = "/Rooms/#{@solution[:room_sid]}/RecordingRules"
                        
                    end
                    ##
                    # Fetch the RecordingRulesInstance
                    # @return [RecordingRulesInstance] Fetched RecordingRulesInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        RecordingRulesInstance.new(
                            @version,
                            payload,
                            room_sid: @solution[:room_sid],
                        )
                    end

                    ##
                    # Update the RecordingRulesInstance
                    # @param [Object] rules A JSON-encoded array of recording rules.
                    # @return [RecordingRulesInstance] Updated RecordingRulesInstance
                    def update(
                        rules: :unset
                    )

                        data = Twilio::Values.of({
                            'Rules' => Twilio.serialize_object(rules),
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        RecordingRulesInstance.new(
                            @version,
                            payload,
                            room_sid: @solution[:room_sid],
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Video.V1.RecordingRulesList>'
                    end
                end

                class RecordingRulesPage < Page
                    ##
                    # Initialize the RecordingRulesPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [RecordingRulesPage] RecordingRulesPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of RecordingRulesInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [RecordingRulesInstance] RecordingRulesInstance
                    def get_instance(payload)
                        RecordingRulesInstance.new(@version, payload, room_sid: @solution[:room_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Video.V1.RecordingRulesPage>'
                    end
                end
                class RecordingRulesInstance < InstanceResource
                    ##
                    # Initialize the RecordingRulesInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this RecordingRules
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [RecordingRulesInstance] RecordingRulesInstance
                    def initialize(version, payload , room_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'room_sid' => payload['room_sid'],
                            'rules' => payload['rules'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                        }
                    end

                    
                    ##
                    # @return [String] The SID of the Room resource for the Recording Rules
                    def room_sid
                        @properties['room_sid']
                    end
                    
                    ##
                    # @return [Array<VideoV1RoomRoomRecordingRuleRules>] A collection of Recording Rules that describe how to include or exclude matching tracks for recording
                    def rules
                        @properties['rules']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Video.V1.RecordingRulesInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Video.V1.RecordingRulesInstance>"
                    end
                end

             end
            end
        end
    end
end


