=begin
Newsletter2Go-API (https://api.newsletter2go.com)

<h5>JSON first</h5><br/>Our REST API exchanges data in the JSON data format. Every parameter you pass (with a few exceptions e.g. when you upload files) should therefore be formatted in JSON and our API will always return results in JSON as well.<br/><br/><h5>Very RESTful</h5><br/>Our API follows a very RESTful approach.<br/>Most importantly, we implemented the following four request methods for CRUD operations:<br/><br/>POST - Create a new record<br/>GET - Retrieve / read records without changing anything<br/>PATCH - Update an existing record<br/>DELETE - Delete one or more records<br/><br/><h5>HTTP Status codes</h5><br/>We also follow the most common HTTP status codes when outputting the API response:<br/><br/><b>2xx - Successful calls</b><br/>200 - Success<br/>201 - Created<br/><br/><b>4xx - Error codes</b><br/>400 - API error - inspect the body for detailed information about what went wrong. The most common error is \"code\":1062, which means, that a unique constraint was hit. For example if the name of the group is already in use.<br/>401 - Not authenticated - invalid access_token. Check if the access_token has expired or is incorrect.<br/>403 - Access denied<br/>404 - Call not available or no records found<br/><br/><b>5xx - API error - please contact support</b><br/><br/><h5>Response format</h5><br/>The API always returns data in the following format<br/><br/><code>{<br/>&nbsp;&nbsp;\"info\": {<br/>&nbsp;&nbsp;&nbsp;&nbsp;\"count\": 0<br/>&nbsp;&nbsp;},<br/>&nbsp;&nbsp;\"value\": [<br/>&nbsp;&nbsp;&nbsp;{<br/>&nbsp;&nbsp;&nbsp;&nbsp;\"key\": \"value\"<br/>&nbsp;&nbsp;&nbsp;}<br/>&nbsp;&nbsp;]<br/>}</code><br/><br/><h5>Recurring GET parameters</h5><br/><ul><li>_filter - a complex filter for filtering the result set based on <a target=\"blank\" href=\"https://tools.ietf.org/html/draft-nottingham-atompub-fiql-00\">FIQL</a>.</li><li>_limit - the maximum number records returned.</li><li>_offset - pagination for the result-set</li><li>_expand - submit true to get all default fields of the resource</li><li>_fields - submit a comma-separated list of case-sensetive field-names to get the values of these fields in the response. You can use this the get values of custom attribute of recipients for example.</li></ul><br/><br/><h5>Filter language</h5><br/>The filter language for filtering results is based on <a target=\"blank\" href=\"https://tools.ietf.org/html/draft-nottingham-atompub-fiql-00\">FIQL</a>.<br/>With the only restriction, that plain values must be surrounded by \". For example first_name==\"Max\"<br/>The following operators are supported<ul><li>Equals - <b>==</b></li><li>Not equals - <b>=ne=</b></li><li>Greater than - <b>=gt=</b></li><li>Greater than equals - <b>=ge=</b></li><li>Lower than - <b>=lt=</b></li><li>Lower than equals - <b>=le=</b></li><li>Like - <b>=like=</b> (in combination with % you are able to search for <i>starts with</i>, <i>ends with</i>, <i>contains</i>. For example first_name=like=\"%Max%\")</li><li>Not like - <b>=nlike=</b></li><li>Logical and - <b>;</b></li><li>Logical or - <b>,</b></li></ul><br/><br/><h5>How to make Calls?</h5><br/>After you authenticated and received a valid access_token, you have to pass it in every consecutive call. Use the Authorization header for that purpose as follows:<br/><code>xhr.setRequestHeader(\"Authorization\", \"Bearer \" + your_access_token);</code><br/><br/>Every call takes additional parameters that can be used to modify the request. These parameters should be passed as JSON<br/><code>var params = {<br/>&nbsp;&nbsp;\"key\"= \"value\"<br/>}<br/>xhr.send(JSON.stringify(params));</code><br/><br/><h5>Sending transactional emails</h5><br/>It is very important to understand the following concept in order for you to take full advantage of our powerful personalization features and our detailed reports when sending transactional emails.<br/><br/>First, you will have to create a new mailing. We recommend that you create that mailing through our UI in order to take full advantage of our powerful newsletter builder. This way, we will automatically create cross-client optimized and responsive HTML. Yet another advantage lies in the possibility for other users (e.g. the marketing team) to change the layout or the content of the mailing without having to contact the developer (you).<br/><br/>Of course, it is also possible to create a mailing through the API. When doing so, you can also take advantage of our cross-client optimized responsive HTML by passing us JSON or YAML according to the Newsletter2Go Markup Language.<br/>No matter how you create the mailing, try to create *one* reusable template. You can customize individual emails by inserting placeholders for personalized fields such as name, products or other information that will be filled through an API call when sending.<br/><br/>By only creating one template, you can take advantage of our full reporting since all emails will be treated part of a \"campaign\". When you change that template, we will create a new version of the mailing in the background and you will be able to see the difference in performance in the reports. This is particularily useful when you are trying to test and optimize different versions of transactional emails such as a sign up email.<br/><br/>After creating a mailing, you will have access to its ID. Use that ID to actually send the email in the next step.<br/><br/>When sending an email, you have to pass the newsletter ID and information about the recipient. Either pass the recipient ID or pass all the recipient's data (including the e-mail-address) as JSON.<br/><br/>If you only pass the recipient ID, we will use his or her data from your list to personalize the mailing. If you pass full recipient data as JSON, we will try to merge the data with existing data from your list.<br/><br/>You can also pass additional data such as product data which is not saved in your list. Just make sure that the placeholders in the source of the mailing correspond to the parameters that you are passing.<br/>This way you can also create for-loops which can be useful if you pass different amounts of data for each recipient (e.g. a purchase confirmation where you want to list all the products that were just bought).

OpenAPI spec version: 1.0.0
Contact: support@newsletter2go.com
Generated by: https://github.com/swagger-api/swagger-codegen.git

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=end

require 'date'

module SwaggerClient

  class RecipientGet
    # the id of the recipient
    attr_accessor :id

    # the email of the recipient
    attr_accessor :email

    # the phone number of the recipient
    attr_accessor :phone

    # m for male and f for female
    attr_accessor :gender

    # the first name of the recipient
    attr_accessor :first_name

    # the last name of the recipient
    attr_accessor :last_name

    # weither the recipient is unsubscribed or not
    attr_accessor :is_unsubscribed

    # weither the recipient is blacklisted or not
    attr_accessor :is_blacklisted

    # every custom attribute can be submitted
    attr_accessor :_custom_attribute_

    # Indicating the quality of the recipient. Between 0 and 5
    attr_accessor :rating

    # how many newsletters the recipient has received
    attr_accessor :statistic_mails_received

    # how many newsletters the recipient has opened
    attr_accessor :statistic_mails_opened

    # how many newsletters the recipient has uniqly opened
    attr_accessor :statistic_mails_unique_opened

    # how often the recipient has clicked on links in newsletters
    attr_accessor :statistic_mails_clicked

    # how often the recipient has converted
    attr_accessor :statistic_conversions

    # how much the recipient has spent
    attr_accessor :statistic_conversions_sum

    # when the recipient has had the last interaction with a newsletter
    attr_accessor :statistic_last_mail_action

    # when the recipient has had received the last newsletter
    attr_accessor :statistic_last_mail_received

    # when the recipient has had opened the last newsletter
    attr_accessor :statistic_last_mail_opened

    # when the recipient has had clicked the last newsletter
    attr_accessor :statistic_last_mail_clicked

    # when the recipient has had converted the last time
    attr_accessor :statistic_last_mail_converted

    # the last useragent device used for opening a newsletter
    attr_accessor :statistic_last_useragent_device

    # the last useragent family used for opening a newsletter
    attr_accessor :statistic_last_useragent_family

    # the last latitude where the recipient has opened a newsletter
    attr_accessor :statistic_last_latitude

    # the last longitude where the recipient has opened a newsletter
    attr_accessor :statistic_last_longitude

    # when the recipient was blacklisted the last time
    attr_accessor :statistic_last_blacklist_list

    # when the recipient was unsubscribed the last time
    attr_accessor :statistic_last_unsubscribe_list

    # the reason the recipient got blacklisted the last time
    attr_accessor :statistic_last_blacklist_list_reason

    # the reason the recipient got unsubscribed the last time
    attr_accessor :statistic_last_unsubscribe_list_reason

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'email' => :'email',
        :'phone' => :'phone',
        :'gender' => :'gender',
        :'first_name' => :'first_name',
        :'last_name' => :'last_name',
        :'is_unsubscribed' => :'is_unsubscribed',
        :'is_blacklisted' => :'is_blacklisted',
        :'_custom_attribute_' => :'_custom_attribute_',
        :'rating' => :'rating',
        :'statistic_mails_received' => :'statistic_mails_received',
        :'statistic_mails_opened' => :'statistic_mails_opened',
        :'statistic_mails_unique_opened' => :'statistic_mails_unique_opened',
        :'statistic_mails_clicked' => :'statistic_mails_clicked',
        :'statistic_conversions' => :'statistic_conversions',
        :'statistic_conversions_sum' => :'statistic_conversions_sum',
        :'statistic_last_mail_action' => :'statistic_last_mail_action',
        :'statistic_last_mail_received' => :'statistic_last_mail_received',
        :'statistic_last_mail_opened' => :'statistic_last_mail_opened',
        :'statistic_last_mail_clicked' => :'statistic_last_mail_clicked',
        :'statistic_last_mail_converted' => :'statistic_last_mail_converted',
        :'statistic_last_useragent_device' => :'statistic_last_useragent_device',
        :'statistic_last_useragent_family' => :'statistic_last_useragent_family',
        :'statistic_last_latitude' => :'statistic_last_latitude',
        :'statistic_last_longitude' => :'statistic_last_longitude',
        :'statistic_last_blacklist_list' => :'statistic_last_blacklist_list',
        :'statistic_last_unsubscribe_list' => :'statistic_last_unsubscribe_list',
        :'statistic_last_blacklist_list_reason' => :'statistic_last_blacklist_list_reason',
        :'statistic_last_unsubscribe_list_reason' => :'statistic_last_unsubscribe_list_reason'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'String',
        :'email' => :'String',
        :'phone' => :'String',
        :'gender' => :'String',
        :'first_name' => :'String',
        :'last_name' => :'String',
        :'is_unsubscribed' => :'BOOLEAN',
        :'is_blacklisted' => :'BOOLEAN',
        :'_custom_attribute_' => :'String',
        :'rating' => :'Integer',
        :'statistic_mails_received' => :'Integer',
        :'statistic_mails_opened' => :'Integer',
        :'statistic_mails_unique_opened' => :'Integer',
        :'statistic_mails_clicked' => :'Integer',
        :'statistic_conversions' => :'Integer',
        :'statistic_conversions_sum' => :'Float',
        :'statistic_last_mail_action' => :'DateTime',
        :'statistic_last_mail_received' => :'DateTime',
        :'statistic_last_mail_opened' => :'DateTime',
        :'statistic_last_mail_clicked' => :'DateTime',
        :'statistic_last_mail_converted' => :'DateTime',
        :'statistic_last_useragent_device' => :'String',
        :'statistic_last_useragent_family' => :'String',
        :'statistic_last_latitude' => :'Float',
        :'statistic_last_longitude' => :'Float',
        :'statistic_last_blacklist_list' => :'DateTime',
        :'statistic_last_unsubscribe_list' => :'DateTime',
        :'statistic_last_blacklist_list_reason' => :'String',
        :'statistic_last_unsubscribe_list_reason' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.has_key?(:'email')
        self.email = attributes[:'email']
      end

      if attributes.has_key?(:'phone')
        self.phone = attributes[:'phone']
      end

      if attributes.has_key?(:'gender')
        self.gender = attributes[:'gender']
      end

      if attributes.has_key?(:'first_name')
        self.first_name = attributes[:'first_name']
      end

      if attributes.has_key?(:'last_name')
        self.last_name = attributes[:'last_name']
      end

      if attributes.has_key?(:'is_unsubscribed')
        self.is_unsubscribed = attributes[:'is_unsubscribed']
      end

      if attributes.has_key?(:'is_blacklisted')
        self.is_blacklisted = attributes[:'is_blacklisted']
      end

      if attributes.has_key?(:'_custom_attribute_')
        self._custom_attribute_ = attributes[:'_custom_attribute_']
      end

      if attributes.has_key?(:'rating')
        self.rating = attributes[:'rating']
      end

      if attributes.has_key?(:'statistic_mails_received')
        self.statistic_mails_received = attributes[:'statistic_mails_received']
      end

      if attributes.has_key?(:'statistic_mails_opened')
        self.statistic_mails_opened = attributes[:'statistic_mails_opened']
      end

      if attributes.has_key?(:'statistic_mails_unique_opened')
        self.statistic_mails_unique_opened = attributes[:'statistic_mails_unique_opened']
      end

      if attributes.has_key?(:'statistic_mails_clicked')
        self.statistic_mails_clicked = attributes[:'statistic_mails_clicked']
      end

      if attributes.has_key?(:'statistic_conversions')
        self.statistic_conversions = attributes[:'statistic_conversions']
      end

      if attributes.has_key?(:'statistic_conversions_sum')
        self.statistic_conversions_sum = attributes[:'statistic_conversions_sum']
      end

      if attributes.has_key?(:'statistic_last_mail_action')
        self.statistic_last_mail_action = attributes[:'statistic_last_mail_action']
      end

      if attributes.has_key?(:'statistic_last_mail_received')
        self.statistic_last_mail_received = attributes[:'statistic_last_mail_received']
      end

      if attributes.has_key?(:'statistic_last_mail_opened')
        self.statistic_last_mail_opened = attributes[:'statistic_last_mail_opened']
      end

      if attributes.has_key?(:'statistic_last_mail_clicked')
        self.statistic_last_mail_clicked = attributes[:'statistic_last_mail_clicked']
      end

      if attributes.has_key?(:'statistic_last_mail_converted')
        self.statistic_last_mail_converted = attributes[:'statistic_last_mail_converted']
      end

      if attributes.has_key?(:'statistic_last_useragent_device')
        self.statistic_last_useragent_device = attributes[:'statistic_last_useragent_device']
      end

      if attributes.has_key?(:'statistic_last_useragent_family')
        self.statistic_last_useragent_family = attributes[:'statistic_last_useragent_family']
      end

      if attributes.has_key?(:'statistic_last_latitude')
        self.statistic_last_latitude = attributes[:'statistic_last_latitude']
      end

      if attributes.has_key?(:'statistic_last_longitude')
        self.statistic_last_longitude = attributes[:'statistic_last_longitude']
      end

      if attributes.has_key?(:'statistic_last_blacklist_list')
        self.statistic_last_blacklist_list = attributes[:'statistic_last_blacklist_list']
      end

      if attributes.has_key?(:'statistic_last_unsubscribe_list')
        self.statistic_last_unsubscribe_list = attributes[:'statistic_last_unsubscribe_list']
      end

      if attributes.has_key?(:'statistic_last_blacklist_list_reason')
        self.statistic_last_blacklist_list_reason = attributes[:'statistic_last_blacklist_list_reason']
      end

      if attributes.has_key?(:'statistic_last_unsubscribe_list_reason')
        self.statistic_last_unsubscribe_list_reason = attributes[:'statistic_last_unsubscribe_list_reason']
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @email.to_s.length < 1
      return false if @phone.to_s.length < 1
      gender_validator = EnumAttributeValidator.new('String', ["m", "f"])
      return false unless gender_validator.valid?(@gender)
      return false if @first_name.to_s.length < 1
      return false if @last_name.to_s.length < 1
      statistic_last_useragent_device_validator = EnumAttributeValidator.new('String', ["desktop", "mobile", "tablet"])
      return false unless statistic_last_useragent_device_validator.valid?(@statistic_last_useragent_device)
      statistic_last_useragent_family_validator = EnumAttributeValidator.new('String', ["lotus_notes", "apple_mail", "thunderbird", "windows_live_mail", "outlook", "iOS", "Android", "Windows", "else"])
      return false unless statistic_last_useragent_family_validator.valid?(@statistic_last_useragent_family)
      return true
    end

    # Custom attribute writer method with validation
    # @param [Object] email Value to be assigned
    def email=(email)
      if email.nil?
        fail ArgumentError, "email cannot be nil"
      end

      if email.to_s.length < 1
        fail ArgumentError, "invalid value for 'email', the character length must be great than or equal to ."
      end

      @email = email
    end

    # Custom attribute writer method with validation
    # @param [Object] phone Value to be assigned
    def phone=(phone)
      if phone.nil?
        fail ArgumentError, "phone cannot be nil"
      end

      if phone.to_s.length < 1
        fail ArgumentError, "invalid value for 'phone', the character length must be great than or equal to ."
      end

      @phone = phone
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] gender Object to be assigned
    def gender=(gender)
      validator = EnumAttributeValidator.new('String', ["m", "f"])
      unless validator.valid?(gender)
        fail ArgumentError, "invalid value for 'gender', must be one of #{validator.allowable_values}."
      end
      @gender = gender
    end

    # Custom attribute writer method with validation
    # @param [Object] first_name Value to be assigned
    def first_name=(first_name)
      if first_name.nil?
        fail ArgumentError, "first_name cannot be nil"
      end

      if first_name.to_s.length < 1
        fail ArgumentError, "invalid value for 'first_name', the character length must be great than or equal to ."
      end

      @first_name = first_name
    end

    # Custom attribute writer method with validation
    # @param [Object] last_name Value to be assigned
    def last_name=(last_name)
      if last_name.nil?
        fail ArgumentError, "last_name cannot be nil"
      end

      if last_name.to_s.length < 1
        fail ArgumentError, "invalid value for 'last_name', the character length must be great than or equal to ."
      end

      @last_name = last_name
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] statistic_last_useragent_device Object to be assigned
    def statistic_last_useragent_device=(statistic_last_useragent_device)
      validator = EnumAttributeValidator.new('String', ["desktop", "mobile", "tablet"])
      unless validator.valid?(statistic_last_useragent_device)
        fail ArgumentError, "invalid value for 'statistic_last_useragent_device', must be one of #{validator.allowable_values}."
      end
      @statistic_last_useragent_device = statistic_last_useragent_device
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] statistic_last_useragent_family Object to be assigned
    def statistic_last_useragent_family=(statistic_last_useragent_family)
      validator = EnumAttributeValidator.new('String', ["lotus_notes", "apple_mail", "thunderbird", "windows_live_mail", "outlook", "iOS", "Android", "Windows", "else"])
      unless validator.valid?(statistic_last_useragent_family)
        fail ArgumentError, "invalid value for 'statistic_last_useragent_family', must be one of #{validator.allowable_values}."
      end
      @statistic_last_useragent_family = statistic_last_useragent_family
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          email == o.email &&
          phone == o.phone &&
          gender == o.gender &&
          first_name == o.first_name &&
          last_name == o.last_name &&
          is_unsubscribed == o.is_unsubscribed &&
          is_blacklisted == o.is_blacklisted &&
          _custom_attribute_ == o._custom_attribute_ &&
          rating == o.rating &&
          statistic_mails_received == o.statistic_mails_received &&
          statistic_mails_opened == o.statistic_mails_opened &&
          statistic_mails_unique_opened == o.statistic_mails_unique_opened &&
          statistic_mails_clicked == o.statistic_mails_clicked &&
          statistic_conversions == o.statistic_conversions &&
          statistic_conversions_sum == o.statistic_conversions_sum &&
          statistic_last_mail_action == o.statistic_last_mail_action &&
          statistic_last_mail_received == o.statistic_last_mail_received &&
          statistic_last_mail_opened == o.statistic_last_mail_opened &&
          statistic_last_mail_clicked == o.statistic_last_mail_clicked &&
          statistic_last_mail_converted == o.statistic_last_mail_converted &&
          statistic_last_useragent_device == o.statistic_last_useragent_device &&
          statistic_last_useragent_family == o.statistic_last_useragent_family &&
          statistic_last_latitude == o.statistic_last_latitude &&
          statistic_last_longitude == o.statistic_last_longitude &&
          statistic_last_blacklist_list == o.statistic_last_blacklist_list &&
          statistic_last_unsubscribe_list == o.statistic_last_unsubscribe_list &&
          statistic_last_blacklist_list_reason == o.statistic_last_blacklist_list_reason &&
          statistic_last_unsubscribe_list_reason == o.statistic_last_unsubscribe_list_reason
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, email, phone, gender, first_name, last_name, is_unsubscribed, is_blacklisted, _custom_attribute_, rating, statistic_mails_received, statistic_mails_opened, statistic_mails_unique_opened, statistic_mails_clicked, statistic_conversions, statistic_conversions_sum, statistic_last_mail_action, statistic_last_mail_received, statistic_last_mail_opened, statistic_last_mail_clicked, statistic_last_mail_converted, statistic_last_useragent_device, statistic_last_useragent_family, statistic_last_latitude, statistic_last_longitude, statistic_last_blacklist_list, statistic_last_unsubscribe_list, statistic_last_blacklist_list_reason, statistic_last_unsubscribe_list_reason].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /^Array<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /^(true|t|yes|y|1)$/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = SwaggerClient.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
