# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'date'
require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module HealthcareV1
      
      # Activates the latest revision of the specified Consent by committing a new
      # revision with `state` updated to `ACTIVE`. If the latest revision of the given
      # Consent is in the `ACTIVE` state, no new revision is committed. A
      # FAILED_PRECONDITION error occurs if the latest revision of the given consent
      # is in the `REJECTED` or `REVOKED` state.
      class ActivateConsentRequest
        include Google::Apis::Core::Hashable
      
        # Required. The resource name of the Consent artifact that contains
        # documentation of the user's consent, of the form `projects/`project_id`/
        # locations/`location_id`/datasets/`dataset_id`/consentStores/`consent_store_id`/
        # consentArtifacts/`consent_artifact_id``. If the draft Consent had a Consent
        # artifact, this Consent artifact overwrites it.
        # Corresponds to the JSON property `consentArtifact`
        # @return [String]
        attr_accessor :consent_artifact
      
        # Timestamp in UTC of when this Consent is considered expired.
        # Corresponds to the JSON property `expireTime`
        # @return [String]
        attr_accessor :expire_time
      
        # The time to live for this Consent from when it is marked as active.
        # Corresponds to the JSON property `ttl`
        # @return [String]
        attr_accessor :ttl
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consent_artifact = args[:consent_artifact] if args.key?(:consent_artifact)
          @expire_time = args[:expire_time] if args.key?(:expire_time)
          @ttl = args[:ttl] if args.key?(:ttl)
        end
      end
      
      # The request to analyze healthcare entities in a document.
      class AnalyzeEntitiesRequest
        include Google::Apis::Core::Hashable
      
        # Optional. Alternative output format to be generated based on the results of
        # analysis.
        # Corresponds to the JSON property `alternativeOutputFormat`
        # @return [String]
        attr_accessor :alternative_output_format
      
        # document_content is a document to be annotated.
        # Corresponds to the JSON property `documentContent`
        # @return [String]
        attr_accessor :document_content
      
        # A list of licensed vocabularies to use in the request, in addition to the
        # default unlicensed vocabularies.
        # Corresponds to the JSON property `licensedVocabularies`
        # @return [Array<String>]
        attr_accessor :licensed_vocabularies
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alternative_output_format = args[:alternative_output_format] if args.key?(:alternative_output_format)
          @document_content = args[:document_content] if args.key?(:document_content)
          @licensed_vocabularies = args[:licensed_vocabularies] if args.key?(:licensed_vocabularies)
        end
      end
      
      # Includes recognized entity mentions and relationships between them.
      class AnalyzeEntitiesResponse
        include Google::Apis::Core::Hashable
      
        # The union of all the candidate entities that the entity_mentions in this
        # response could link to. These are UMLS concepts or normalized mention content.
        # Corresponds to the JSON property `entities`
        # @return [Array<Google::Apis::HealthcareV1::Entity>]
        attr_accessor :entities
      
        # The `entity_mentions` field contains all the annotated medical entities that
        # were mentioned in the provided document.
        # Corresponds to the JSON property `entityMentions`
        # @return [Array<Google::Apis::HealthcareV1::EntityMention>]
        attr_accessor :entity_mentions
      
        # The FHIR bundle ([`R4`](http://hl7.org/fhir/R4/bundle.html)) that includes all
        # the entities, the entity mentions, and the relationships in JSON format.
        # Corresponds to the JSON property `fhirBundle`
        # @return [String]
        attr_accessor :fhir_bundle
      
        # relationships contains all the binary relationships that were identified
        # between entity mentions within the provided document.
        # Corresponds to the JSON property `relationships`
        # @return [Array<Google::Apis::HealthcareV1::EntityMentionRelationship>]
        attr_accessor :relationships
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entities = args[:entities] if args.key?(:entities)
          @entity_mentions = args[:entity_mentions] if args.key?(:entity_mentions)
          @fhir_bundle = args[:fhir_bundle] if args.key?(:fhir_bundle)
          @relationships = args[:relationships] if args.key?(:relationships)
        end
      end
      
      # Archives the specified User data mapping.
      class ArchiveUserDataMappingRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Archives the specified User data mapping.
      class ArchiveUserDataMappingResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # An attribute value for a Consent or User data mapping. Each Attribute must
      # have a corresponding AttributeDefinition in the consent store that defines the
      # default and allowed values.
      class Attribute
        include Google::Apis::Core::Hashable
      
        # Indicates the name of an attribute defined in the consent store.
        # Corresponds to the JSON property `attributeDefinitionId`
        # @return [String]
        attr_accessor :attribute_definition_id
      
        # Required. The value of the attribute. Must be an acceptable value as defined
        # in the consent store. For example, if the consent store defines "data type"
        # with acceptable values "questionnaire" and "step-count", when the attribute
        # name is data type, this field must contain one of those values.
        # Corresponds to the JSON property `values`
        # @return [Array<String>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attribute_definition_id = args[:attribute_definition_id] if args.key?(:attribute_definition_id)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # A client-defined consent attribute.
      class AttributeDefinition
        include Google::Apis::Core::Hashable
      
        # Required. Possible values for the attribute. The number of allowed values must
        # not exceed 500. An empty list is invalid. The list can only be expanded after
        # creation.
        # Corresponds to the JSON property `allowedValues`
        # @return [Array<String>]
        attr_accessor :allowed_values
      
        # Required. The category of the attribute. The value of this field cannot be
        # changed after creation.
        # Corresponds to the JSON property `category`
        # @return [String]
        attr_accessor :category
      
        # Optional. Default values of the attribute in Consents. If no default values
        # are specified, it defaults to an empty value.
        # Corresponds to the JSON property `consentDefaultValues`
        # @return [Array<String>]
        attr_accessor :consent_default_values
      
        # Optional. Default value of the attribute in User data mappings. If no default
        # value is specified, it defaults to an empty value. This field is only
        # applicable to attributes of the category `RESOURCE`.
        # Corresponds to the JSON property `dataMappingDefaultValue`
        # @return [String]
        attr_accessor :data_mapping_default_value
      
        # Optional. A description of the attribute.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Resource name of the Attribute definition, of the form `projects/`project_id`/
        # locations/`location_id`/datasets/`dataset_id`/consentStores/`consent_store_id`/
        # attributeDefinitions/`attribute_definition_id``. Cannot be changed after
        # creation.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allowed_values = args[:allowed_values] if args.key?(:allowed_values)
          @category = args[:category] if args.key?(:category)
          @consent_default_values = args[:consent_default_values] if args.key?(:consent_default_values)
          @data_mapping_default_value = args[:data_mapping_default_value] if args.key?(:data_mapping_default_value)
          @description = args[:description] if args.key?(:description)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Specifies the audit configuration for a service. The configuration determines
      # which permission types are logged, and what identities, if any, are exempted
      # from logging. An AuditConfig must have one or more AuditLogConfigs. If there
      # are AuditConfigs for both `allServices` and a specific service, the union of
      # the two AuditConfigs is used for that service: the log_types specified in each
      # AuditConfig are enabled, and the exempted_members in each AuditLogConfig are
      # exempted. Example Policy with multiple AuditConfigs: ` "audit_configs": [ ` "
      # service": "allServices", "audit_log_configs": [ ` "log_type": "DATA_READ", "
      # exempted_members": [ "user:jose@example.com" ] `, ` "log_type": "DATA_WRITE" `,
      # ` "log_type": "ADMIN_READ" ` ] `, ` "service": "sampleservice.googleapis.com",
      # "audit_log_configs": [ ` "log_type": "DATA_READ" `, ` "log_type": "DATA_WRITE"
      # , "exempted_members": [ "user:aliya@example.com" ] ` ] ` ] ` For sampleservice,
      # this policy enables DATA_READ, DATA_WRITE and ADMIN_READ logging. It also
      # exempts `jose@example.com` from DATA_READ logging, and `aliya@example.com`
      # from DATA_WRITE logging.
      class AuditConfig
        include Google::Apis::Core::Hashable
      
        # The configuration for logging of each type of permission.
        # Corresponds to the JSON property `auditLogConfigs`
        # @return [Array<Google::Apis::HealthcareV1::AuditLogConfig>]
        attr_accessor :audit_log_configs
      
        # Specifies a service that will be enabled for audit logging. For example, `
        # storage.googleapis.com`, `cloudsql.googleapis.com`. `allServices` is a special
        # value that covers all services.
        # Corresponds to the JSON property `service`
        # @return [String]
        attr_accessor :service
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audit_log_configs = args[:audit_log_configs] if args.key?(:audit_log_configs)
          @service = args[:service] if args.key?(:service)
        end
      end
      
      # Provides the configuration for logging a type of permissions. Example: ` "
      # audit_log_configs": [ ` "log_type": "DATA_READ", "exempted_members": [ "user:
      # jose@example.com" ] `, ` "log_type": "DATA_WRITE" ` ] ` This enables '
      # DATA_READ' and 'DATA_WRITE' logging, while exempting jose@example.com from
      # DATA_READ logging.
      class AuditLogConfig
        include Google::Apis::Core::Hashable
      
        # Specifies the identities that do not cause logging for this type of permission.
        # Follows the same format of Binding.members.
        # Corresponds to the JSON property `exemptedMembers`
        # @return [Array<String>]
        attr_accessor :exempted_members
      
        # The log type that this config enables.
        # Corresponds to the JSON property `logType`
        # @return [String]
        attr_accessor :log_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exempted_members = args[:exempted_members] if args.key?(:exempted_members)
          @log_type = args[:log_type] if args.key?(:log_type)
        end
      end
      
      # Associates `members`, or principals, with a `role`.
      class Binding
        include Google::Apis::Core::Hashable
      
        # Represents a textual expression in the Common Expression Language (CEL) syntax.
        # CEL is a C-like expression language. The syntax and semantics of CEL are
        # documented at https://github.com/google/cel-spec. Example (Comparison): title:
        # "Summary size limit" description: "Determines if a summary is less than 100
        # chars" expression: "document.summary.size() < 100" Example (Equality): title: "
        # Requestor is owner" description: "Determines if requestor is the document
        # owner" expression: "document.owner == request.auth.claims.email" Example (
        # Logic): title: "Public documents" description: "Determine whether the document
        # should be publicly visible" expression: "document.type != 'private' &&
        # document.type != 'internal'" Example (Data Manipulation): title: "Notification
        # string" description: "Create a notification string with a timestamp."
        # expression: "'New message received at ' + string(document.create_time)" The
        # exact variables and functions that may be referenced within an expression are
        # determined by the service that evaluates it. See the service documentation for
        # additional information.
        # Corresponds to the JSON property `condition`
        # @return [Google::Apis::HealthcareV1::Expr]
        attr_accessor :condition
      
        # Specifies the principals requesting access for a Google Cloud resource. `
        # members` can have the following values: * `allUsers`: A special identifier
        # that represents anyone who is on the internet; with or without a Google
        # account. * `allAuthenticatedUsers`: A special identifier that represents
        # anyone who is authenticated with a Google account or a service account. Does
        # not include identities that come from external identity providers (IdPs)
        # through identity federation. * `user:`emailid``: An email address that
        # represents a specific Google account. For example, `alice@example.com` . * `
        # serviceAccount:`emailid``: An email address that represents a Google service
        # account. For example, `my-other-app@appspot.gserviceaccount.com`. * `
        # serviceAccount:`projectid`.svc.id.goog[`namespace`/`kubernetes-sa`]`: An
        # identifier for a [Kubernetes service account](https://cloud.google.com/
        # kubernetes-engine/docs/how-to/kubernetes-service-accounts). For example, `my-
        # project.svc.id.goog[my-namespace/my-kubernetes-sa]`. * `group:`emailid``: An
        # email address that represents a Google group. For example, `admins@example.com`
        # . * `domain:`domain``: The G Suite domain (primary) that represents all the
        # users of that domain. For example, `google.com` or `example.com`. * `deleted:
        # user:`emailid`?uid=`uniqueid``: An email address (plus unique identifier)
        # representing a user that has been recently deleted. For example, `alice@
        # example.com?uid=123456789012345678901`. If the user is recovered, this value
        # reverts to `user:`emailid`` and the recovered user retains the role in the
        # binding. * `deleted:serviceAccount:`emailid`?uid=`uniqueid``: An email address
        # (plus unique identifier) representing a service account that has been recently
        # deleted. For example, `my-other-app@appspot.gserviceaccount.com?uid=
        # 123456789012345678901`. If the service account is undeleted, this value
        # reverts to `serviceAccount:`emailid`` and the undeleted service account
        # retains the role in the binding. * `deleted:group:`emailid`?uid=`uniqueid``:
        # An email address (plus unique identifier) representing a Google group that has
        # been recently deleted. For example, `admins@example.com?uid=
        # 123456789012345678901`. If the group is recovered, this value reverts to `
        # group:`emailid`` and the recovered group retains the role in the binding.
        # Corresponds to the JSON property `members`
        # @return [Array<String>]
        attr_accessor :members
      
        # Role that is assigned to the list of `members`, or principals. For example, `
        # roles/viewer`, `roles/editor`, or `roles/owner`.
        # Corresponds to the JSON property `role`
        # @return [String]
        attr_accessor :role
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @condition = args[:condition] if args.key?(:condition)
          @members = args[:members] if args.key?(:members)
          @role = args[:role] if args.key?(:role)
        end
      end
      
      # The request message for Operations.CancelOperation.
      class CancelOperationRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Mask a string by replacing its characters with a fixed character.
      class CharacterMaskConfig
        include Google::Apis::Core::Hashable
      
        # Character to mask the sensitive values. If not supplied, defaults to "*".
        # Corresponds to the JSON property `maskingCharacter`
        # @return [String]
        attr_accessor :masking_character
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @masking_character = args[:masking_character] if args.key?(:masking_character)
        end
      end
      
      # Checks if a particular data_id of a User data mapping in the given consent
      # store is consented for a given use.
      class CheckDataAccessRequest
        include Google::Apis::Core::Hashable
      
        # List of resource names of Consent resources.
        # Corresponds to the JSON property `consentList`
        # @return [Google::Apis::HealthcareV1::ConsentList]
        attr_accessor :consent_list
      
        # Required. The unique identifier of the resource to check access for. This
        # identifier must correspond to a User data mapping in the given consent store.
        # Corresponds to the JSON property `dataId`
        # @return [String]
        attr_accessor :data_id
      
        # The values of request attributes associated with this access request.
        # Corresponds to the JSON property `requestAttributes`
        # @return [Hash<String,String>]
        attr_accessor :request_attributes
      
        # Optional. The view for CheckDataAccessResponse. If unspecified, defaults to `
        # BASIC` and returns `consented` as `TRUE` or `FALSE`.
        # Corresponds to the JSON property `responseView`
        # @return [String]
        attr_accessor :response_view
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consent_list = args[:consent_list] if args.key?(:consent_list)
          @data_id = args[:data_id] if args.key?(:data_id)
          @request_attributes = args[:request_attributes] if args.key?(:request_attributes)
          @response_view = args[:response_view] if args.key?(:response_view)
        end
      end
      
      # Checks if a particular data_id of a User data mapping in the given consent
      # store is consented for a given use.
      class CheckDataAccessResponse
        include Google::Apis::Core::Hashable
      
        # The resource names of all evaluated Consents mapped to their evaluation.
        # Corresponds to the JSON property `consentDetails`
        # @return [Hash<String,Google::Apis::HealthcareV1::ConsentEvaluation>]
        attr_accessor :consent_details
      
        # Whether the requested resource is consented for the given use.
        # Corresponds to the JSON property `consented`
        # @return [Boolean]
        attr_accessor :consented
        alias_method :consented?, :consented
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consent_details = args[:consent_details] if args.key?(:consent_details)
          @consented = args[:consented] if args.key?(:consented)
        end
      end
      
      # Represents a user's consent.
      class Consent
        include Google::Apis::Core::Hashable
      
        # Required. The resource name of the Consent artifact that contains proof of the
        # end user's consent, of the form `projects/`project_id`/locations/`location_id`/
        # datasets/`dataset_id`/consentStores/`consent_store_id`/consentArtifacts/`
        # consent_artifact_id``.
        # Corresponds to the JSON property `consentArtifact`
        # @return [String]
        attr_accessor :consent_artifact
      
        # Timestamp in UTC of when this Consent is considered expired.
        # Corresponds to the JSON property `expireTime`
        # @return [String]
        attr_accessor :expire_time
      
        # Optional. User-supplied key-value pairs used to organize Consent resources.
        # Metadata keys must: - be between 1 and 63 characters long - have a UTF-8
        # encoding of maximum 128 bytes - begin with a letter - consist of up to 63
        # characters including lowercase letters, numeric characters, underscores, and
        # dashes Metadata values must be: - be between 1 and 63 characters long - have a
        # UTF-8 encoding of maximum 128 bytes - consist of up to 63 characters including
        # lowercase letters, numeric characters, underscores, and dashes No more than 64
        # metadata entries can be associated with a given consent.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,String>]
        attr_accessor :metadata
      
        # Resource name of the Consent, of the form `projects/`project_id`/locations/`
        # location_id`/datasets/`dataset_id`/consentStores/`consent_store_id`/consents/`
        # consent_id``. Cannot be changed after creation.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. Represents a user's consent in terms of the resources that can be
        # accessed and under what conditions.
        # Corresponds to the JSON property `policies`
        # @return [Array<Google::Apis::HealthcareV1::GoogleCloudHealthcareV1ConsentPolicy>]
        attr_accessor :policies
      
        # Output only. The timestamp that the revision was created.
        # Corresponds to the JSON property `revisionCreateTime`
        # @return [String]
        attr_accessor :revision_create_time
      
        # Output only. The revision ID of the Consent. The format is an 8-character
        # hexadecimal string. Refer to a specific revision of a Consent by appending `@`
        # revision_id`` to the Consent's resource name.
        # Corresponds to the JSON property `revisionId`
        # @return [String]
        attr_accessor :revision_id
      
        # Required. Indicates the current state of this Consent.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Input only. The time to live for this Consent from when it is created.
        # Corresponds to the JSON property `ttl`
        # @return [String]
        attr_accessor :ttl
      
        # Required. User's UUID provided by the client.
        # Corresponds to the JSON property `userId`
        # @return [String]
        attr_accessor :user_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consent_artifact = args[:consent_artifact] if args.key?(:consent_artifact)
          @expire_time = args[:expire_time] if args.key?(:expire_time)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
          @policies = args[:policies] if args.key?(:policies)
          @revision_create_time = args[:revision_create_time] if args.key?(:revision_create_time)
          @revision_id = args[:revision_id] if args.key?(:revision_id)
          @state = args[:state] if args.key?(:state)
          @ttl = args[:ttl] if args.key?(:ttl)
          @user_id = args[:user_id] if args.key?(:user_id)
        end
      end
      
      # Documentation of a user's consent.
      class ConsentArtifact
        include Google::Apis::Core::Hashable
      
        # Optional. Screenshots, PDFs, or other binary information documenting the user'
        # s consent.
        # Corresponds to the JSON property `consentContentScreenshots`
        # @return [Array<Google::Apis::HealthcareV1::Image>]
        attr_accessor :consent_content_screenshots
      
        # Optional. An string indicating the version of the consent information shown to
        # the user.
        # Corresponds to the JSON property `consentContentVersion`
        # @return [String]
        attr_accessor :consent_content_version
      
        # User signature.
        # Corresponds to the JSON property `guardianSignature`
        # @return [Google::Apis::HealthcareV1::Signature]
        attr_accessor :guardian_signature
      
        # Optional. Metadata associated with the Consent artifact. For example, the
        # consent locale or user agent version.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,String>]
        attr_accessor :metadata
      
        # Resource name of the Consent artifact, of the form `projects/`project_id`/
        # locations/`location_id`/datasets/`dataset_id`/consentStores/`consent_store_id`/
        # consentArtifacts/`consent_artifact_id``. Cannot be changed after creation.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Required. User's UUID provided by the client.
        # Corresponds to the JSON property `userId`
        # @return [String]
        attr_accessor :user_id
      
        # User signature.
        # Corresponds to the JSON property `userSignature`
        # @return [Google::Apis::HealthcareV1::Signature]
        attr_accessor :user_signature
      
        # User signature.
        # Corresponds to the JSON property `witnessSignature`
        # @return [Google::Apis::HealthcareV1::Signature]
        attr_accessor :witness_signature
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consent_content_screenshots = args[:consent_content_screenshots] if args.key?(:consent_content_screenshots)
          @consent_content_version = args[:consent_content_version] if args.key?(:consent_content_version)
          @guardian_signature = args[:guardian_signature] if args.key?(:guardian_signature)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
          @user_id = args[:user_id] if args.key?(:user_id)
          @user_signature = args[:user_signature] if args.key?(:user_signature)
          @witness_signature = args[:witness_signature] if args.key?(:witness_signature)
        end
      end
      
      # The detailed evaluation of a particular Consent.
      class ConsentEvaluation
        include Google::Apis::Core::Hashable
      
        # The evaluation result.
        # Corresponds to the JSON property `evaluationResult`
        # @return [String]
        attr_accessor :evaluation_result
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @evaluation_result = args[:evaluation_result] if args.key?(:evaluation_result)
        end
      end
      
      # List of resource names of Consent resources.
      class ConsentList
        include Google::Apis::Core::Hashable
      
        # The resource names of the Consents to evaluate against, of the form `projects/`
        # project_id`/locations/`location_id`/datasets/`dataset_id`/consentStores/`
        # consent_store_id`/consents/`consent_id``.
        # Corresponds to the JSON property `consents`
        # @return [Array<String>]
        attr_accessor :consents
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consents = args[:consents] if args.key?(:consents)
        end
      end
      
      # Represents a consent store.
      class ConsentStore
        include Google::Apis::Core::Hashable
      
        # Optional. Default time to live for Consents created in this store. Must be at
        # least 24 hours. Updating this field will not affect the expiration time of
        # existing consents.
        # Corresponds to the JSON property `defaultConsentTtl`
        # @return [String]
        attr_accessor :default_consent_ttl
      
        # Optional. If `true`, UpdateConsent creates the Consent if it does not already
        # exist. If unspecified, defaults to `false`.
        # Corresponds to the JSON property `enableConsentCreateOnUpdate`
        # @return [Boolean]
        attr_accessor :enable_consent_create_on_update
        alias_method :enable_consent_create_on_update?, :enable_consent_create_on_update
      
        # Optional. User-supplied key-value pairs used to organize consent stores. Label
        # keys must be between 1 and 63 characters long, have a UTF-8 encoding of
        # maximum 128 bytes, and must conform to the following PCRE regular expression: \
        # p`Ll`\p`Lo``0,62`. Label values must be between 1 and 63 characters long, have
        # a UTF-8 encoding of maximum 128 bytes, and must conform to the following PCRE
        # regular expression: [\p`Ll`\p`Lo`\p`N`_-]`0,63`. No more than 64 labels can be
        # associated with a given store. For more information: https://cloud.google.com/
        # healthcare/docs/how-tos/labeling-resources
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Resource name of the consent store, of the form `projects/`project_id`/
        # locations/`location_id`/datasets/`dataset_id`/consentStores/`consent_store_id``
        # . Cannot be changed after creation.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @default_consent_ttl = args[:default_consent_ttl] if args.key?(:default_consent_ttl)
          @enable_consent_create_on_update = args[:enable_consent_create_on_update] if args.key?(:enable_consent_create_on_update)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Creates a new message.
      class CreateMessageRequest
        include Google::Apis::Core::Hashable
      
        # A complete HL7v2 message. See [Introduction to HL7 Standards] (https://www.hl7.
        # org/implement/standards/index.cfm?ref=common) for details on the standard.
        # Corresponds to the JSON property `message`
        # @return [Google::Apis::HealthcareV1::Message]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # Pseudonymization method that generates surrogates via cryptographic hashing.
      # Uses SHA-256. Outputs a base64-encoded representation of the hashed output (
      # for example, `L7k0BHmF1ha5U3NfGykjro4xWi1MPVQPjhMAZbSV9mM=`).
      class CryptoHashConfig
        include Google::Apis::Core::Hashable
      
        # An AES 128/192/256 bit key. Causes the hash to be computed based on this key.
        # A default key is generated for each Deidentify operation and is used when
        # neither `crypto_key` nor `kms_wrapped` is specified. Must not be set if `
        # kms_wrapped` is set.
        # Corresponds to the JSON property `cryptoKey`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :crypto_key
      
        # Include to use an existing data crypto key wrapped by KMS. The wrapped key
        # must be a 128-, 192-, or 256-bit key. The key must grant the Cloud IAM
        # permission `cloudkms.cryptoKeyVersions.useToDecrypt` to the project's Cloud
        # Healthcare Service Agent service account. For more information, see [Creating
        # a wrapped key] (https://cloud.google.com/dlp/docs/create-wrapped-key).
        # Corresponds to the JSON property `kmsWrapped`
        # @return [Google::Apis::HealthcareV1::KmsWrappedCryptoKey]
        attr_accessor :kms_wrapped
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @crypto_key = args[:crypto_key] if args.key?(:crypto_key)
          @kms_wrapped = args[:kms_wrapped] if args.key?(:kms_wrapped)
        end
      end
      
      # A message representing a health dataset. A health dataset represents a
      # collection of healthcare data pertaining to one or more patients. This may
      # include multiple modalities of healthcare data, such as electronic medical
      # records or medical imaging data.
      class Dataset
        include Google::Apis::Core::Hashable
      
        # Resource name of the dataset, of the form `projects/`project_id`/locations/`
        # location_id`/datasets/`dataset_id``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The default timezone used by this dataset. Must be a either a valid IANA time
        # zone name such as "America/New_York" or empty, which defaults to UTC. This is
        # used for parsing times in resources, such as HL7 messages, where no explicit
        # timezone is specified.
        # Corresponds to the JSON property `timeZone`
        # @return [String]
        attr_accessor :time_zone
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @time_zone = args[:time_zone] if args.key?(:time_zone)
        end
      end
      
      # Shift a date forward or backward in time by a random amount which is
      # consistent for a given patient and crypto key combination.
      class DateShiftConfig
        include Google::Apis::Core::Hashable
      
        # An AES 128/192/256 bit key. The date shift is computed based on this key and
        # the patient ID. If the patient ID is empty for a DICOM resource, the date
        # shift is computed based on this key and the study instance UID. If `crypto_key`
        # is not set, then `kms_wrapped` is used to calculate the date shift. If
        # neither is set, a default key is generated for each de-identify operation.
        # Must not be set if `kms_wrapped` is set.
        # Corresponds to the JSON property `cryptoKey`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :crypto_key
      
        # Include to use an existing data crypto key wrapped by KMS. The wrapped key
        # must be a 128-, 192-, or 256-bit key. The key must grant the Cloud IAM
        # permission `cloudkms.cryptoKeyVersions.useToDecrypt` to the project's Cloud
        # Healthcare Service Agent service account. For more information, see [Creating
        # a wrapped key] (https://cloud.google.com/dlp/docs/create-wrapped-key).
        # Corresponds to the JSON property `kmsWrapped`
        # @return [Google::Apis::HealthcareV1::KmsWrappedCryptoKey]
        attr_accessor :kms_wrapped
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @crypto_key = args[:crypto_key] if args.key?(:crypto_key)
          @kms_wrapped = args[:kms_wrapped] if args.key?(:kms_wrapped)
        end
      end
      
      # Contains configuration for streaming de-identified FHIR export.
      class DeidentifiedStoreDestination
        include Google::Apis::Core::Hashable
      
        # Configures de-id options specific to different types of content. Each
        # submessage customizes the handling of an https://tools.ietf.org/html/rfc6838
        # media type or subtype. Configs are applied in a nested manner at runtime.
        # Corresponds to the JSON property `config`
        # @return [Google::Apis::HealthcareV1::DeidentifyConfig]
        attr_accessor :config
      
        # The full resource name of a Cloud Healthcare FHIR store, for example, `
        # projects/`project_id`/locations/`location_id`/datasets/`dataset_id`/fhirStores/
        # `fhir_store_id``.
        # Corresponds to the JSON property `store`
        # @return [String]
        attr_accessor :store
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @config = args[:config] if args.key?(:config)
          @store = args[:store] if args.key?(:store)
        end
      end
      
      # Configures de-id options specific to different types of content. Each
      # submessage customizes the handling of an https://tools.ietf.org/html/rfc6838
      # media type or subtype. Configs are applied in a nested manner at runtime.
      class DeidentifyConfig
        include Google::Apis::Core::Hashable
      
        # Specifies the parameters needed for de-identification of DICOM stores.
        # Corresponds to the JSON property `dicom`
        # @return [Google::Apis::HealthcareV1::DicomConfig]
        attr_accessor :dicom
      
        # Specifies how to handle de-identification of a FHIR store.
        # Corresponds to the JSON property `fhir`
        # @return [Google::Apis::HealthcareV1::FhirConfig]
        attr_accessor :fhir
      
        # Specifies how to handle de-identification of image pixels.
        # Corresponds to the JSON property `image`
        # @return [Google::Apis::HealthcareV1::ImageConfig]
        attr_accessor :image
      
        # Configures de-identification of text wherever it is found in the
        # source_dataset.
        # Corresponds to the JSON property `text`
        # @return [Google::Apis::HealthcareV1::TextConfig]
        attr_accessor :text
      
        # Ensures in-flight data remains in the region of origin during de-
        # identification. Using this option results in a significant reduction of
        # throughput, and is not compatible with `LOCATION` or `ORGANIZATION_NAME`
        # infoTypes. `LOCATION` must be excluded within `TextConfig`, and must also be
        # excluded within `ImageConfig` if image redaction is required.
        # Corresponds to the JSON property `useRegionalDataProcessing`
        # @return [Boolean]
        attr_accessor :use_regional_data_processing
        alias_method :use_regional_data_processing?, :use_regional_data_processing
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dicom = args[:dicom] if args.key?(:dicom)
          @fhir = args[:fhir] if args.key?(:fhir)
          @image = args[:image] if args.key?(:image)
          @text = args[:text] if args.key?(:text)
          @use_regional_data_processing = args[:use_regional_data_processing] if args.key?(:use_regional_data_processing)
        end
      end
      
      # Redacts identifying information from the specified dataset.
      class DeidentifyDatasetRequest
        include Google::Apis::Core::Hashable
      
        # Configures de-id options specific to different types of content. Each
        # submessage customizes the handling of an https://tools.ietf.org/html/rfc6838
        # media type or subtype. Configs are applied in a nested manner at runtime.
        # Corresponds to the JSON property `config`
        # @return [Google::Apis::HealthcareV1::DeidentifyConfig]
        attr_accessor :config
      
        # The name of the dataset resource to create and write the redacted data to. *
        # The destination dataset must not exist. * The destination dataset must be in
        # the same location as the source dataset. De-identifying data across multiple
        # locations is not supported.
        # Corresponds to the JSON property `destinationDataset`
        # @return [String]
        attr_accessor :destination_dataset
      
        # Cloud Storage location to read the JSON cloud.healthcare.deidentify.
        # DeidentifyConfig from, overriding the default config. Must be of the form `gs:/
        # /`bucket_id`/path/to/object`. The Cloud Storage location must grant the Cloud
        # IAM role `roles/storage.objectViewer` to the project's Cloud Healthcare
        # Service Agent service account. Only one of `config` and `gcs_config_uri` can
        # be specified.
        # Corresponds to the JSON property `gcsConfigUri`
        # @return [String]
        attr_accessor :gcs_config_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @config = args[:config] if args.key?(:config)
          @destination_dataset = args[:destination_dataset] if args.key?(:destination_dataset)
          @gcs_config_uri = args[:gcs_config_uri] if args.key?(:gcs_config_uri)
        end
      end
      
      # Creates a new DICOM store with sensitive information de-identified.
      class DeidentifyDicomStoreRequest
        include Google::Apis::Core::Hashable
      
        # Configures de-id options specific to different types of content. Each
        # submessage customizes the handling of an https://tools.ietf.org/html/rfc6838
        # media type or subtype. Configs are applied in a nested manner at runtime.
        # Corresponds to the JSON property `config`
        # @return [Google::Apis::HealthcareV1::DeidentifyConfig]
        attr_accessor :config
      
        # The name of the DICOM store to create and write the redacted data to. For
        # example, `projects/`project_id`/locations/`location_id`/datasets/`dataset_id`/
        # dicomStores/`dicom_store_id``. * The destination dataset must exist. * The
        # source dataset and destination dataset must both reside in the same location.
        # De-identifying data across multiple locations is not supported. * The
        # destination DICOM store must not exist. * The caller must have the necessary
        # permissions to create the destination DICOM store.
        # Corresponds to the JSON property `destinationStore`
        # @return [String]
        attr_accessor :destination_store
      
        # Specifies the filter configuration for DICOM resources.
        # Corresponds to the JSON property `filterConfig`
        # @return [Google::Apis::HealthcareV1::DicomFilterConfig]
        attr_accessor :filter_config
      
        # Cloud Storage location to read the JSON cloud.healthcare.deidentify.
        # DeidentifyConfig from, overriding the default config. Must be of the form `gs:/
        # /`bucket_id`/path/to/object`. The Cloud Storage location must grant the Cloud
        # IAM role `roles/storage.objectViewer` to the project's Cloud Healthcare
        # Service Agent service account. Only one of `config` and `gcs_config_uri` can
        # be specified.
        # Corresponds to the JSON property `gcsConfigUri`
        # @return [String]
        attr_accessor :gcs_config_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @config = args[:config] if args.key?(:config)
          @destination_store = args[:destination_store] if args.key?(:destination_store)
          @filter_config = args[:filter_config] if args.key?(:filter_config)
          @gcs_config_uri = args[:gcs_config_uri] if args.key?(:gcs_config_uri)
        end
      end
      
      # Creates a new FHIR store with sensitive information de-identified.
      class DeidentifyFhirStoreRequest
        include Google::Apis::Core::Hashable
      
        # Configures de-id options specific to different types of content. Each
        # submessage customizes the handling of an https://tools.ietf.org/html/rfc6838
        # media type or subtype. Configs are applied in a nested manner at runtime.
        # Corresponds to the JSON property `config`
        # @return [Google::Apis::HealthcareV1::DeidentifyConfig]
        attr_accessor :config
      
        # The name of the FHIR store to create and write the redacted data to. For
        # example, `projects/`project_id`/locations/`location_id`/datasets/`dataset_id`/
        # fhirStores/`fhir_store_id``. * The destination dataset must exist. * The
        # source dataset and destination dataset must both reside in the same location.
        # De-identifying data across multiple locations is not supported. * The
        # destination FHIR store must exist. * The caller must have the healthcare.
        # fhirResources.update permission to write to the destination FHIR store.
        # Corresponds to the JSON property `destinationStore`
        # @return [String]
        attr_accessor :destination_store
      
        # Cloud Storage location to read the JSON cloud.healthcare.deidentify.
        # DeidentifyConfig from, overriding the default config. Must be of the form `gs:/
        # /`bucket_id`/path/to/object`. The Cloud Storage location must grant the Cloud
        # IAM role `roles/storage.objectViewer` to the project's Cloud Healthcare
        # Service Agent service account. Only one of `config` and `gcs_config_uri` can
        # be specified.
        # Corresponds to the JSON property `gcsConfigUri`
        # @return [String]
        attr_accessor :gcs_config_uri
      
        # Filter configuration.
        # Corresponds to the JSON property `resourceFilter`
        # @return [Google::Apis::HealthcareV1::FhirFilter]
        attr_accessor :resource_filter
      
        # If true, skips resources that are created or modified after the de-identify
        # operation is created.
        # Corresponds to the JSON property `skipModifiedResources`
        # @return [Boolean]
        attr_accessor :skip_modified_resources
        alias_method :skip_modified_resources?, :skip_modified_resources
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @config = args[:config] if args.key?(:config)
          @destination_store = args[:destination_store] if args.key?(:destination_store)
          @gcs_config_uri = args[:gcs_config_uri] if args.key?(:gcs_config_uri)
          @resource_filter = args[:resource_filter] if args.key?(:resource_filter)
          @skip_modified_resources = args[:skip_modified_resources] if args.key?(:skip_modified_resources)
        end
      end
      
      # Contains a summary of the Deidentify operation.
      class DeidentifySummary
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Specifies the parameters needed for de-identification of DICOM stores.
      class DicomConfig
        include Google::Apis::Core::Hashable
      
        # Tag filtering profile that determines which tags to keep/remove.
        # Corresponds to the JSON property `filterProfile`
        # @return [String]
        attr_accessor :filter_profile
      
        # List of tags to be filtered.
        # Corresponds to the JSON property `keepList`
        # @return [Google::Apis::HealthcareV1::TagFilterList]
        attr_accessor :keep_list
      
        # List of tags to be filtered.
        # Corresponds to the JSON property `removeList`
        # @return [Google::Apis::HealthcareV1::TagFilterList]
        attr_accessor :remove_list
      
        # If true, skip replacing StudyInstanceUID, SeriesInstanceUID, SOPInstanceUID,
        # and MediaStorageSOPInstanceUID and leave them untouched. The Cloud Healthcare
        # API regenerates these UIDs by default based on the DICOM Standard's reasoning:
        # "Whilst these UIDs cannot be mapped directly to an individual out of context,
        # given access to the original images, or to a database of the original images
        # containing the UIDs, it would be possible to recover the individual's identity.
        # " http://dicom.nema.org/medical/dicom/current/output/chtml/part15/sect_E.3.9.
        # html
        # Corresponds to the JSON property `skipIdRedaction`
        # @return [Boolean]
        attr_accessor :skip_id_redaction
        alias_method :skip_id_redaction?, :skip_id_redaction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filter_profile = args[:filter_profile] if args.key?(:filter_profile)
          @keep_list = args[:keep_list] if args.key?(:keep_list)
          @remove_list = args[:remove_list] if args.key?(:remove_list)
          @skip_id_redaction = args[:skip_id_redaction] if args.key?(:skip_id_redaction)
        end
      end
      
      # Specifies the filter configuration for DICOM resources.
      class DicomFilterConfig
        include Google::Apis::Core::Hashable
      
        # The Cloud Storage location of the filter configuration file. The `gcs_uri`
        # must be in the format `gs://bucket/path/to/object`. The filter configuration
        # file must contain a list of resource paths separated by newline characters (\n
        # or \r\n). Each resource path must be in the format "/studies/`studyUID`[/
        # series/`seriesUID`[/instances/`instanceUID`]]" The Cloud Healthcare API
        # service account must have the `roles/storage.objectViewer` Cloud IAM role for
        # this Cloud Storage location.
        # Corresponds to the JSON property `resourcePathsGcsUri`
        # @return [String]
        attr_accessor :resource_paths_gcs_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @resource_paths_gcs_uri = args[:resource_paths_gcs_uri] if args.key?(:resource_paths_gcs_uri)
        end
      end
      
      # Represents a DICOM store.
      class DicomStore
        include Google::Apis::Core::Hashable
      
        # User-supplied key-value pairs used to organize DICOM stores. Label keys must
        # be between 1 and 63 characters long, have a UTF-8 encoding of maximum 128
        # bytes, and must conform to the following PCRE regular expression: \p`Ll`\p`Lo``
        # 0,62` Label values are optional, must be between 1 and 63 characters long,
        # have a UTF-8 encoding of maximum 128 bytes, and must conform to the following
        # PCRE regular expression: [\p`Ll`\p`Lo`\p`N`_-]`0,63` No more than 64 labels
        # can be associated with a given store.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Resource name of the DICOM store, of the form `projects/`project_id`/locations/
        # `location_id`/datasets/`dataset_id`/dicomStores/`dicom_store_id``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Specifies where to send notifications upon changes to a data store.
        # Corresponds to the JSON property `notificationConfig`
        # @return [Google::Apis::HealthcareV1::NotificationConfig]
        attr_accessor :notification_config
      
        # Optional. A list of streaming configs used to configure the destination of
        # streaming exports for every DICOM instance insertion in this DICOM store.
        # After a new config is added to `stream_configs`, DICOM instance insertions are
        # streamed to the new destination. When a config is removed from `stream_configs`
        # , the server stops streaming to that destination. Each config must contain a
        # unique destination.
        # Corresponds to the JSON property `streamConfigs`
        # @return [Array<Google::Apis::HealthcareV1::GoogleCloudHealthcareV1DicomStreamConfig>]
        attr_accessor :stream_configs
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
          @notification_config = args[:notification_config] if args.key?(:notification_config)
          @stream_configs = args[:stream_configs] if args.key?(:stream_configs)
        end
      end
      
      # A generic empty message that you can re-use to avoid defining duplicated empty
      # messages in your APIs. A typical example is to use it as the request or the
      # response type of an API method. For instance: service Foo ` rpc Bar(google.
      # protobuf.Empty) returns (google.protobuf.Empty); `
      class Empty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # The candidate entities that an entity mention could link to.
      class Entity
        include Google::Apis::Core::Hashable
      
        # entity_id is a first class field entity_id uniquely identifies this concept
        # and its meta-vocabulary. For example, "UMLS/C0000970".
        # Corresponds to the JSON property `entityId`
        # @return [String]
        attr_accessor :entity_id
      
        # preferred_term is the preferred term for this concept. For example, "
        # Acetaminophen". For ad hoc entities formed by normalization, this is the most
        # popular unnormalized string.
        # Corresponds to the JSON property `preferredTerm`
        # @return [String]
        attr_accessor :preferred_term
      
        # Vocabulary codes are first-class fields and differentiated from the concept
        # unique identifier (entity_id). vocabulary_codes contains the representation of
        # this concept in particular vocabularies, such as ICD-10, SNOMED-CT and RxNORM.
        # These are prefixed by the name of the vocabulary, followed by the unique code
        # within that vocabulary. For example, "RXNORM/A10334543".
        # Corresponds to the JSON property `vocabularyCodes`
        # @return [Array<String>]
        attr_accessor :vocabulary_codes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entity_id = args[:entity_id] if args.key?(:entity_id)
          @preferred_term = args[:preferred_term] if args.key?(:preferred_term)
          @vocabulary_codes = args[:vocabulary_codes] if args.key?(:vocabulary_codes)
        end
      end
      
      # An entity mention in the document.
      class EntityMention
        include Google::Apis::Core::Hashable
      
        # A feature of an entity mention.
        # Corresponds to the JSON property `certaintyAssessment`
        # @return [Google::Apis::HealthcareV1::Feature]
        attr_accessor :certainty_assessment
      
        # The model's confidence in this entity mention annotation. A number between 0
        # and 1.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # linked_entities are candidate ontological concepts that this entity mention
        # may refer to. They are sorted by decreasing confidence.
        # Corresponds to the JSON property `linkedEntities`
        # @return [Array<Google::Apis::HealthcareV1::LinkedEntity>]
        attr_accessor :linked_entities
      
        # mention_id uniquely identifies each entity mention in a single response.
        # Corresponds to the JSON property `mentionId`
        # @return [String]
        attr_accessor :mention_id
      
        # A feature of an entity mention.
        # Corresponds to the JSON property `subject`
        # @return [Google::Apis::HealthcareV1::Feature]
        attr_accessor :subject
      
        # A feature of an entity mention.
        # Corresponds to the JSON property `temporalAssessment`
        # @return [Google::Apis::HealthcareV1::Feature]
        attr_accessor :temporal_assessment
      
        # A span of text in the provided document.
        # Corresponds to the JSON property `text`
        # @return [Google::Apis::HealthcareV1::TextSpan]
        attr_accessor :text
      
        # The semantic type of the entity: UNKNOWN_ENTITY_TYPE, ALONE,
        # ANATOMICAL_STRUCTURE, ASSISTED_LIVING, BF_RESULT, BM_RESULT, BM_UNIT, BM_VALUE,
        # BODY_FUNCTION, BODY_MEASUREMENT, COMPLIANT, DOESNOT_FOLLOWUP, FAMILY,
        # FOLLOWSUP, LABORATORY_DATA, LAB_RESULT, LAB_UNIT, LAB_VALUE, MEDICAL_DEVICE,
        # MEDICINE, MED_DOSE, MED_DURATION, MED_FORM, MED_FREQUENCY, MED_ROUTE,
        # MED_STATUS, MED_STRENGTH, MED_TOTALDOSE, MED_UNIT, NON_COMPLIANT,
        # OTHER_LIVINGSTATUS, PROBLEM, PROCEDURE, PROCEDURE_RESULT, PROC_METHOD,
        # REASON_FOR_NONCOMPLIANCE, SEVERITY, SUBSTANCE_ABUSE, UNCLEAR_FOLLOWUP.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @certainty_assessment = args[:certainty_assessment] if args.key?(:certainty_assessment)
          @confidence = args[:confidence] if args.key?(:confidence)
          @linked_entities = args[:linked_entities] if args.key?(:linked_entities)
          @mention_id = args[:mention_id] if args.key?(:mention_id)
          @subject = args[:subject] if args.key?(:subject)
          @temporal_assessment = args[:temporal_assessment] if args.key?(:temporal_assessment)
          @text = args[:text] if args.key?(:text)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Defines directed relationship from one entity mention to another.
      class EntityMentionRelationship
        include Google::Apis::Core::Hashable
      
        # The model's confidence in this annotation. A number between 0 and 1.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # object_id is the id of the object entity mention.
        # Corresponds to the JSON property `objectId`
        # @return [String]
        attr_accessor :object_id_prop
      
        # subject_id is the id of the subject entity mention.
        # Corresponds to the JSON property `subjectId`
        # @return [String]
        attr_accessor :subject_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @object_id_prop = args[:object_id_prop] if args.key?(:object_id_prop)
          @subject_id = args[:subject_id] if args.key?(:subject_id)
        end
      end
      
      # Evaluate a user's Consents for all matching User data mappings. Note: User
      # data mappings are indexed asynchronously, causing slight delays between the
      # time mappings are created or updated and when they are included in
      # EvaluateUserConsents results.
      class EvaluateUserConsentsRequest
        include Google::Apis::Core::Hashable
      
        # List of resource names of Consent resources.
        # Corresponds to the JSON property `consentList`
        # @return [Google::Apis::HealthcareV1::ConsentList]
        attr_accessor :consent_list
      
        # Optional. Limit on the number of User data mappings to return in a single
        # response. If not specified, 100 is used. May not be larger than 1000.
        # Corresponds to the JSON property `pageSize`
        # @return [Fixnum]
        attr_accessor :page_size
      
        # Optional. Token to retrieve the next page of results, or empty to get the
        # first page.
        # Corresponds to the JSON property `pageToken`
        # @return [String]
        attr_accessor :page_token
      
        # Required. The values of request attributes associated with this access request.
        # Corresponds to the JSON property `requestAttributes`
        # @return [Hash<String,String>]
        attr_accessor :request_attributes
      
        # Optional. The values of resource attributes associated with the resources
        # being requested. If no values are specified, then all resources are queried.
        # Corresponds to the JSON property `resourceAttributes`
        # @return [Hash<String,String>]
        attr_accessor :resource_attributes
      
        # Optional. The view for EvaluateUserConsentsResponse. If unspecified, defaults
        # to `BASIC` and returns `consented` as `TRUE` or `FALSE`.
        # Corresponds to the JSON property `responseView`
        # @return [String]
        attr_accessor :response_view
      
        # Required. User ID to evaluate consents for.
        # Corresponds to the JSON property `userId`
        # @return [String]
        attr_accessor :user_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consent_list = args[:consent_list] if args.key?(:consent_list)
          @page_size = args[:page_size] if args.key?(:page_size)
          @page_token = args[:page_token] if args.key?(:page_token)
          @request_attributes = args[:request_attributes] if args.key?(:request_attributes)
          @resource_attributes = args[:resource_attributes] if args.key?(:resource_attributes)
          @response_view = args[:response_view] if args.key?(:response_view)
          @user_id = args[:user_id] if args.key?(:user_id)
        end
      end
      
      # 
      class EvaluateUserConsentsResponse
        include Google::Apis::Core::Hashable
      
        # Token to retrieve the next page of results, or empty if there are no more
        # results in the list. This token is valid for 72 hours after it is created.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The consent evaluation result for each `data_id`.
        # Corresponds to the JSON property `results`
        # @return [Array<Google::Apis::HealthcareV1::Result>]
        attr_accessor :results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @results = args[:results] if args.key?(:results)
        end
      end
      
      # Exports data from the specified DICOM store. If a given resource, such as a
      # DICOM object with the same SOPInstance UID, already exists in the output, it
      # is overwritten with the version in the source dataset. Exported DICOM data
      # persists when the DICOM store from which it was exported is deleted.
      class ExportDicomDataRequest
        include Google::Apis::Core::Hashable
      
        # The BigQuery table where the server writes the output.
        # Corresponds to the JSON property `bigqueryDestination`
        # @return [Google::Apis::HealthcareV1::GoogleCloudHealthcareV1DicomBigQueryDestination]
        attr_accessor :bigquery_destination
      
        # The Cloud Storage location where the server writes the output and the export
        # configuration.
        # Corresponds to the JSON property `gcsDestination`
        # @return [Google::Apis::HealthcareV1::GoogleCloudHealthcareV1DicomGcsDestination]
        attr_accessor :gcs_destination
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bigquery_destination = args[:bigquery_destination] if args.key?(:bigquery_destination)
          @gcs_destination = args[:gcs_destination] if args.key?(:gcs_destination)
        end
      end
      
      # Returns additional information in regards to a completed DICOM store export.
      class ExportDicomDataResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Request to schedule an export.
      class ExportMessagesRequest
        include Google::Apis::Core::Hashable
      
        # The end of the range in `send_time` (MSH.7, https://www.hl7.org/documentcenter/
        # public_temp_2E58C1F9-1C23-BA17-0C6126475344DA9D/wg/conf/HL7MSH.htm) to process.
        # If not specified, the time when the export is scheduled is used. This value
        # has to come after the `start_time` defined below. Only messages whose `
        # send_time` lies in the range `start_time` (inclusive) to `end_time` (exclusive)
        # are exported.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Restricts messages exported to those matching a filter, only applicable to
        # PubsubDestination and GcsDestination. The following syntax is available: * A
        # string field value can be written as text inside quotation marks, for example `
        # "query text"`. The only valid relational operation for text fields is equality
        # (`=`), where text is searched within the field, rather than having the field
        # be equal to the text. For example, `"Comment = great"` returns messages with `
        # great` in the comment field. * A number field value can be written as an
        # integer, a decimal, or an exponential. The valid relational operators for
        # number fields are the equality operator (`=`), along with the less than/
        # greater than operators (`<`, `<=`, `>`, `>=`). Note that there is no
        # inequality (`!=`) operator. You can prepend the `NOT` operator to an
        # expression to negate it. * A date field value must be written in the `yyyy-mm-
        # dd` format. Fields with date and time use the RFC3339 time format. Leading
        # zeros are required for one-digit months and days. The valid relational
        # operators for date fields are the equality operator (`=`) , along with the
        # less than/greater than operators (`<`, `<=`, `>`, `>=`). Note that there is no
        # inequality (`!=`) operator. You can prepend the `NOT` operator to an
        # expression to negate it. * Multiple field query expressions can be combined in
        # one query by adding `AND` or `OR` operators between the expressions. If a
        # boolean operator appears within a quoted string, it is not treated as special,
        # and is just another part of the character string to be matched. You can
        # prepend the `NOT` operator to an expression to negate it. The following fields
        # and functions are available for filtering: * `message_type`, from the MSH-9.1
        # field. For example, `NOT message_type = "ADT"`. * `send_date` or `sendDate`,
        # the `yyyy-mm-dd` date the message was sent in the dataset's time_zone, from
        # the MSH-7 segment. For example, `send_date < "2017-01-02"`. * `send_time`, the
        # timestamp when the message was sent, using the RFC3339 time format for
        # comparisons, from the MSH-7 segment. For example, `send_time < "2017-01-02T00:
        # 00:00-05:00"`. * `create_time`, the timestamp when the message was created in
        # the HL7v2 store. Use the RFC3339 time format for comparisons. For example, `
        # create_time < "2017-01-02T00:00:00-05:00"`. * `send_facility`, the care center
        # that the message came from, from the MSH-4 segment. For example, `
        # send_facility = "ABC"`. Note: The filter will be applied to every message in
        # the HL7v2 store whose `send_time` lies in the range defined by the `start_time`
        # and the `end_time`. Even if the filter only matches a small set of messages,
        # the export operation can still take a long time to finish when a lot of
        # messages are between the specified `start_time` and `end_time` range.
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # The Cloud Storage output destination. The Cloud Healthcare Service Agent
        # requires the `roles/storage.objectAdmin` Cloud IAM roles on the Cloud Storage
        # location.
        # Corresponds to the JSON property `gcsDestination`
        # @return [Google::Apis::HealthcareV1::GcsDestination]
        attr_accessor :gcs_destination
      
        # The Pub/Sub output destination. The Cloud Healthcare Service Agent requires
        # the `roles/pubsub.publisher` Cloud IAM role on the Pub/Sub topic.
        # Corresponds to the JSON property `pubsubDestination`
        # @return [Google::Apis::HealthcareV1::PubsubDestination]
        attr_accessor :pubsub_destination
      
        # The start of the range in `send_time` (MSH.7, https://www.hl7.org/
        # documentcenter/public_temp_2E58C1F9-1C23-BA17-0C6126475344DA9D/wg/conf/HL7MSH.
        # htm) to process. If not specified, the UNIX epoch (1970-01-01T00:00:00Z) is
        # used. This value has to come before the `end_time` defined below. Only
        # messages whose `send_time` lies in the range `start_time` (inclusive) to `
        # end_time` (exclusive) are exported.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_time = args[:end_time] if args.key?(:end_time)
          @filter = args[:filter] if args.key?(:filter)
          @gcs_destination = args[:gcs_destination] if args.key?(:gcs_destination)
          @pubsub_destination = args[:pubsub_destination] if args.key?(:pubsub_destination)
          @start_time = args[:start_time] if args.key?(:start_time)
        end
      end
      
      # Final response for the export operation. This structure is included in the
      # response to describe the detailed outcome.
      class ExportMessagesResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Request to export resources.
      class ExportResourcesRequest
        include Google::Apis::Core::Hashable
      
        # If provided, only resources updated after this time are exported. The time
        # uses the format YYYY-MM-DDThh:mm:ss.sss+zz:zz. For example, `2015-02-07T13:28:
        # 17.239+02:00` or `2017-01-01T00:00:00Z`. The time must be specified to the
        # second and include a time zone.
        # Corresponds to the JSON property `_since`
        # @return [String]
        attr_accessor :_since
      
        # String of comma-delimited FHIR resource types. If provided, only resources of
        # the specified resource type(s) are exported.
        # Corresponds to the JSON property `_type`
        # @return [String]
        attr_accessor :_type
      
        # The configuration for exporting to BigQuery.
        # Corresponds to the JSON property `bigqueryDestination`
        # @return [Google::Apis::HealthcareV1::GoogleCloudHealthcareV1FhirBigQueryDestination]
        attr_accessor :bigquery_destination
      
        # The configuration for exporting to Cloud Storage.
        # Corresponds to the JSON property `gcsDestination`
        # @return [Google::Apis::HealthcareV1::GoogleCloudHealthcareV1FhirGcsDestination]
        attr_accessor :gcs_destination
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @_since = args[:_since] if args.key?(:_since)
          @_type = args[:_type] if args.key?(:_type)
          @bigquery_destination = args[:bigquery_destination] if args.key?(:bigquery_destination)
          @gcs_destination = args[:gcs_destination] if args.key?(:gcs_destination)
        end
      end
      
      # Response when all resources export successfully. This structure is included in
      # the response to describe the detailed outcome after the operation finishes
      # successfully.
      class ExportResourcesResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Represents a textual expression in the Common Expression Language (CEL) syntax.
      # CEL is a C-like expression language. The syntax and semantics of CEL are
      # documented at https://github.com/google/cel-spec. Example (Comparison): title:
      # "Summary size limit" description: "Determines if a summary is less than 100
      # chars" expression: "document.summary.size() < 100" Example (Equality): title: "
      # Requestor is owner" description: "Determines if requestor is the document
      # owner" expression: "document.owner == request.auth.claims.email" Example (
      # Logic): title: "Public documents" description: "Determine whether the document
      # should be publicly visible" expression: "document.type != 'private' &&
      # document.type != 'internal'" Example (Data Manipulation): title: "Notification
      # string" description: "Create a notification string with a timestamp."
      # expression: "'New message received at ' + string(document.create_time)" The
      # exact variables and functions that may be referenced within an expression are
      # determined by the service that evaluates it. See the service documentation for
      # additional information.
      class Expr
        include Google::Apis::Core::Hashable
      
        # Optional. Description of the expression. This is a longer text which describes
        # the expression, e.g. when hovered over it in a UI.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Textual representation of an expression in Common Expression Language syntax.
        # Corresponds to the JSON property `expression`
        # @return [String]
        attr_accessor :expression
      
        # Optional. String indicating the location of the expression for error reporting,
        # e.g. a file name and a position in the file.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # Optional. Title for the expression, i.e. a short string describing its purpose.
        # This can be used e.g. in UIs which allow to enter the expression.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @expression = args[:expression] if args.key?(:expression)
          @location = args[:location] if args.key?(:location)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # A feature of an entity mention.
      class Feature
        include Google::Apis::Core::Hashable
      
        # The model's confidence in this feature annotation. A number between 0 and 1.
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # The value of this feature annotation. Its range depends on the type of the
        # feature.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Specifies how to handle de-identification of a FHIR store.
      class FhirConfig
        include Google::Apis::Core::Hashable
      
        # The behaviour for handling FHIR extensions that aren't otherwise specified for
        # de-identification. If true, all extensions are preserved during de-
        # identification by default. If false or unspecified, all extensions are removed
        # during de-identification by default.
        # Corresponds to the JSON property `defaultKeepExtensions`
        # @return [Boolean]
        attr_accessor :default_keep_extensions
        alias_method :default_keep_extensions?, :default_keep_extensions
      
        # Specifies FHIR paths to match and how to transform them. Any field that is not
        # matched by a FieldMetadata is passed through to the output dataset unmodified.
        # All extensions will be processed according to `default_keep_extensions`.
        # Corresponds to the JSON property `fieldMetadataList`
        # @return [Array<Google::Apis::HealthcareV1::FieldMetadata>]
        attr_accessor :field_metadata_list
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @default_keep_extensions = args[:default_keep_extensions] if args.key?(:default_keep_extensions)
          @field_metadata_list = args[:field_metadata_list] if args.key?(:field_metadata_list)
        end
      end
      
      # Filter configuration.
      class FhirFilter
        include Google::Apis::Core::Hashable
      
        # A list of FHIR resources.
        # Corresponds to the JSON property `resources`
        # @return [Google::Apis::HealthcareV1::Resources]
        attr_accessor :resources
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @resources = args[:resources] if args.key?(:resources)
        end
      end
      
      # Contains the configuration for FHIR notifications.
      class FhirNotificationConfig
        include Google::Apis::Core::Hashable
      
        # The [Pub/Sub](https://cloud.google.com/pubsub/docs/) topic that notifications
        # of changes are published on. Supplied by the client. The notification is a `
        # PubsubMessage` with the following fields: * `PubsubMessage.Data` contains the
        # resource name. * `PubsubMessage.MessageId` is the ID of this notification. It
        # is guaranteed to be unique within the topic. * `PubsubMessage.PublishTime` is
        # the time when the message was published. Note that notifications are only sent
        # if the topic is non-empty. [Topic names](https://cloud.google.com/pubsub/docs/
        # overview#names) must be scoped to a project. The Cloud Healthcare API service
        # account, service-@gcp-sa-healthcare.iam.gserviceaccount.com, must have
        # publisher permissions on the given Pub/Sub topic. Not having adequate
        # permissions causes the calls that send notifications to fail (https://cloud.
        # google.com/healthcare-api/docs/permissions-healthcare-api-gcp-products#
        # dicom_fhir_and_hl7v2_store_cloud_pubsub_permissions). If a notification can't
        # be published to Pub/Sub, errors are logged to Cloud Logging. For more
        # information, see [Viewing error logs in Cloud Logging](https://cloud.google.
        # com/healthcare-api/docs/how-tos/logging).
        # Corresponds to the JSON property `pubsubTopic`
        # @return [String]
        attr_accessor :pubsub_topic
      
        # Whether to send full FHIR resource to this Pub/Sub topic.
        # Corresponds to the JSON property `sendFullResource`
        # @return [Boolean]
        attr_accessor :send_full_resource
        alias_method :send_full_resource?, :send_full_resource
      
        # Whether to send full FHIR resource to this Pub/Sub topic for deleting FHIR
        # resource. Note that setting this to true does not guarantee that all previous
        # resources will be sent in the format of full FHIR resource. When a resource
        # change is too large or during heavy traffic, only the resource name will be
        # sent. Clients should always check the "payloadType" label from a Pub/Sub
        # message to determine whether it needs to fetch the full previous resource as a
        # separate operation.
        # Corresponds to the JSON property `sendPreviousResourceOnDelete`
        # @return [Boolean]
        attr_accessor :send_previous_resource_on_delete
        alias_method :send_previous_resource_on_delete?, :send_previous_resource_on_delete
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @pubsub_topic = args[:pubsub_topic] if args.key?(:pubsub_topic)
          @send_full_resource = args[:send_full_resource] if args.key?(:send_full_resource)
          @send_previous_resource_on_delete = args[:send_previous_resource_on_delete] if args.key?(:send_previous_resource_on_delete)
        end
      end
      
      # Represents a FHIR store.
      class FhirStore
        include Google::Apis::Core::Hashable
      
        # Enable parsing of references within complex FHIR data types such as Extensions.
        # If this value is set to ENABLED, then features like referential integrity and
        # Bundle reference rewriting apply to all references. If this flag has not been
        # specified the behavior of the FHIR store will not change, references in
        # complex data types will not be parsed. New stores will have this value set to
        # ENABLED after a notification period. Warning: turning on this flag causes
        # processing existing resources to fail if they contain references to non-
        # existent resources.
        # Corresponds to the JSON property `complexDataTypeReferenceParsing`
        # @return [String]
        attr_accessor :complex_data_type_reference_parsing
      
        # If true, overrides the default search behavior for this FHIR store to `
        # handling=strict` which returns an error for unrecognized search parameters. If
        # false, uses the FHIR specification default `handling=lenient` which ignores
        # unrecognized search parameters. The handling can always be changed from the
        # default on an individual API call by setting the HTTP header `Prefer: handling=
        # strict` or `Prefer: handling=lenient`.
        # Corresponds to the JSON property `defaultSearchHandlingStrict`
        # @return [Boolean]
        attr_accessor :default_search_handling_strict
        alias_method :default_search_handling_strict?, :default_search_handling_strict
      
        # Immutable. Whether to disable referential integrity in this FHIR store. This
        # field is immutable after FHIR store creation. The default value is false,
        # meaning that the API enforces referential integrity and fails the requests
        # that result in inconsistent state in the FHIR store. When this field is set to
        # true, the API skips referential integrity checks. Consequently, operations
        # that rely on references, such as GetPatientEverything, do not return all the
        # results if broken references exist.
        # Corresponds to the JSON property `disableReferentialIntegrity`
        # @return [Boolean]
        attr_accessor :disable_referential_integrity
        alias_method :disable_referential_integrity?, :disable_referential_integrity
      
        # Immutable. Whether to disable resource versioning for this FHIR store. This
        # field can not be changed after the creation of FHIR store. If set to false,
        # which is the default behavior, all write operations cause historical versions
        # to be recorded automatically. The historical versions can be fetched through
        # the history APIs, but cannot be updated. If set to true, no historical
        # versions are kept. The server sends errors for attempts to read the historical
        # versions.
        # Corresponds to the JSON property `disableResourceVersioning`
        # @return [Boolean]
        attr_accessor :disable_resource_versioning
        alias_method :disable_resource_versioning?, :disable_resource_versioning
      
        # Whether this FHIR store has the [updateCreate capability](https://www.hl7.org/
        # fhir/capabilitystatement-definitions.html#CapabilityStatement.rest.resource.
        # updateCreate). This determines if the client can use an Update operation to
        # create a new resource with a client-specified ID. If false, all IDs are server-
        # assigned through the Create operation and attempts to update a non-existent
        # resource return errors. It is strongly advised not to include or encode any
        # sensitive data such as patient identifiers in client-specified resource IDs.
        # Those IDs are part of the FHIR resource path recorded in Cloud audit logs and
        # Pub/Sub notifications. Those IDs can also be contained in reference fields
        # within other resources.
        # Corresponds to the JSON property `enableUpdateCreate`
        # @return [Boolean]
        attr_accessor :enable_update_create
        alias_method :enable_update_create?, :enable_update_create
      
        # User-supplied key-value pairs used to organize FHIR stores. Label keys must be
        # between 1 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes,
        # and must conform to the following PCRE regular expression: \p`Ll`\p`Lo``0,62`
        # Label values are optional, must be between 1 and 63 characters long, have a
        # UTF-8 encoding of maximum 128 bytes, and must conform to the following PCRE
        # regular expression: [\p`Ll`\p`Lo`\p`N`_-]`0,63` No more than 64 labels can be
        # associated with a given store.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Output only. Resource name of the FHIR store, of the form `projects/`
        # project_id`/datasets/`dataset_id`/fhirStores/`fhir_store_id``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Specifies where to send notifications upon changes to a data store.
        # Corresponds to the JSON property `notificationConfig`
        # @return [Google::Apis::HealthcareV1::NotificationConfig]
        attr_accessor :notification_config
      
        # Specifies where and whether to send notifications upon changes to a FHIR store.
        # Corresponds to the JSON property `notificationConfigs`
        # @return [Array<Google::Apis::HealthcareV1::FhirNotificationConfig>]
        attr_accessor :notification_configs
      
        # A list of streaming configs that configure the destinations of streaming
        # export for every resource mutation in this FHIR store. Each store is allowed
        # to have up to 10 streaming configs. After a new config is added, the next
        # resource mutation is streamed to the new location in addition to the existing
        # ones. When a location is removed from the list, the server stops streaming to
        # that location. Before adding a new config, you must add the required [`
        # bigquery.dataEditor`](https://cloud.google.com/bigquery/docs/access-control#
        # bigquery.dataEditor) role to your project's **Cloud Healthcare Service Agent**
        # [service account](https://cloud.google.com/iam/docs/service-accounts). Some
        # lag (typically on the order of dozens of seconds) is expected before the
        # results show up in the streaming destination.
        # Corresponds to the JSON property `streamConfigs`
        # @return [Array<Google::Apis::HealthcareV1::StreamConfig>]
        attr_accessor :stream_configs
      
        # Contains the configuration for FHIR profiles and validation.
        # Corresponds to the JSON property `validationConfig`
        # @return [Google::Apis::HealthcareV1::ValidationConfig]
        attr_accessor :validation_config
      
        # Immutable. The FHIR specification version that this FHIR store supports
        # natively. This field is immutable after store creation. Requests are rejected
        # if they contain FHIR resources of a different version. Version is required for
        # every FHIR store.
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @complex_data_type_reference_parsing = args[:complex_data_type_reference_parsing] if args.key?(:complex_data_type_reference_parsing)
          @default_search_handling_strict = args[:default_search_handling_strict] if args.key?(:default_search_handling_strict)
          @disable_referential_integrity = args[:disable_referential_integrity] if args.key?(:disable_referential_integrity)
          @disable_resource_versioning = args[:disable_resource_versioning] if args.key?(:disable_resource_versioning)
          @enable_update_create = args[:enable_update_create] if args.key?(:enable_update_create)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
          @notification_config = args[:notification_config] if args.key?(:notification_config)
          @notification_configs = args[:notification_configs] if args.key?(:notification_configs)
          @stream_configs = args[:stream_configs] if args.key?(:stream_configs)
          @validation_config = args[:validation_config] if args.key?(:validation_config)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Count of resources and total storage size by type for a given FHIR store.
      class FhirStoreMetric
        include Google::Apis::Core::Hashable
      
        # The total count of FHIR resources in the store of this resource type.
        # Corresponds to the JSON property `count`
        # @return [Fixnum]
        attr_accessor :count
      
        # The FHIR resource type this metric applies to.
        # Corresponds to the JSON property `resourceType`
        # @return [String]
        attr_accessor :resource_type
      
        # The total amount of structured storage used by FHIR resources of this resource
        # type in the store.
        # Corresponds to the JSON property `structuredStorageSizeBytes`
        # @return [Fixnum]
        attr_accessor :structured_storage_size_bytes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @count = args[:count] if args.key?(:count)
          @resource_type = args[:resource_type] if args.key?(:resource_type)
          @structured_storage_size_bytes = args[:structured_storage_size_bytes] if args.key?(:structured_storage_size_bytes)
        end
      end
      
      # List of metrics for a given FHIR store.
      class FhirStoreMetrics
        include Google::Apis::Core::Hashable
      
        # List of FhirStoreMetric by resource type.
        # Corresponds to the JSON property `metrics`
        # @return [Array<Google::Apis::HealthcareV1::FhirStoreMetric>]
        attr_accessor :metrics
      
        # The resource name of the FHIR store to get metrics for, in the format `
        # projects/`project_id`/datasets/`dataset_id`/fhirStores/`fhir_store_id``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @metrics = args[:metrics] if args.key?(:metrics)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # A (sub) field of a type.
      class Field
        include Google::Apis::Core::Hashable
      
        # The maximum number of times this field can be repeated. 0 or -1 means
        # unbounded.
        # Corresponds to the JSON property `maxOccurs`
        # @return [Fixnum]
        attr_accessor :max_occurs
      
        # The minimum number of times this field must be present/repeated.
        # Corresponds to the JSON property `minOccurs`
        # @return [Fixnum]
        attr_accessor :min_occurs
      
        # The name of the field. For example, "PID-1" or just "1".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The HL7v2 table this field refers to. For example, PID-15 (Patient's Primary
        # Language) usually refers to table "0296".
        # Corresponds to the JSON property `table`
        # @return [String]
        attr_accessor :table
      
        # The type of this field. A Type with this name must be defined in an
        # Hl7TypesConfig.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_occurs = args[:max_occurs] if args.key?(:max_occurs)
          @min_occurs = args[:min_occurs] if args.key?(:min_occurs)
          @name = args[:name] if args.key?(:name)
          @table = args[:table] if args.key?(:table)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Specifies FHIR paths to match, and how to handle de-identification of matching
      # fields.
      class FieldMetadata
        include Google::Apis::Core::Hashable
      
        # Deidentify action for one field.
        # Corresponds to the JSON property `action`
        # @return [String]
        attr_accessor :action
      
        # List of paths to FHIR fields to be redacted. Each path is a period-separated
        # list where each component is either a field name or FHIR type name, for
        # example: Patient, HumanName. For "choice" types (those defined in the FHIR
        # spec with the form: field[x]) we use two separate components. For example, "
        # deceasedAge.unit" is matched by "Deceased.Age.unit". Supported types are:
        # AdministrativeGenderCode, Base64Binary, Boolean, Code, Date, DateTime, Decimal,
        # HumanName, Id, Instant, Integer, LanguageCode, Markdown, Oid, PositiveInt,
        # String, UnsignedInt, Uri, Uuid, Xhtml.
        # Corresponds to the JSON property `paths`
        # @return [Array<String>]
        attr_accessor :paths
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action = args[:action] if args.key?(:action)
          @paths = args[:paths] if args.key?(:paths)
        end
      end
      
      # The Cloud Storage output destination. The Cloud Healthcare Service Agent
      # requires the `roles/storage.objectAdmin` Cloud IAM roles on the Cloud Storage
      # location.
      class GcsDestination
        include Google::Apis::Core::Hashable
      
        # The format of the exported HL7v2 message files.
        # Corresponds to the JSON property `contentStructure`
        # @return [String]
        attr_accessor :content_structure
      
        # Specifies the parts of the Message resource to include in the export. If not
        # specified, FULL is used.
        # Corresponds to the JSON property `messageView`
        # @return [String]
        attr_accessor :message_view
      
        # URI of an existing Cloud Storage directory where the server writes result
        # files, in the format `gs://`bucket-id`/`path/to/destination/dir``. If there is
        # no trailing slash, the service appends one when composing the object path.
        # Corresponds to the JSON property `uriPrefix`
        # @return [String]
        attr_accessor :uri_prefix
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_structure = args[:content_structure] if args.key?(:content_structure)
          @message_view = args[:message_view] if args.key?(:message_view)
          @uri_prefix = args[:uri_prefix] if args.key?(:uri_prefix)
        end
      end
      
      # Specifies the configuration for importing data from Cloud Storage.
      class GcsSource
        include Google::Apis::Core::Hashable
      
        # Points to a Cloud Storage URI containing file(s) to import. The URI must be in
        # the following format: `gs://`bucket_id`/`object_id``. The URI can include
        # wildcards in `object_id` and thus identify multiple files. Supported wildcards:
        # * `*` to match 0 or more non-separator characters * `**` to match 0 or more
        # characters (including separators). Must be used at the end of a path and with
        # no other wildcards in the path. Can also be used with a file extension (such
        # as .ndjson), which imports all files with the extension in the specified
        # directory and its sub-directories. For example, `gs://my-bucket/my-directory/**
        # .ndjson` imports all files with `.ndjson` extensions in `my-directory/` and
        # its sub-directories. * `?` to match 1 character Files matching the wildcard
        # are expected to contain content only, no metadata.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # The Cloud Storage location for export.
      class GoogleCloudHealthcareV1ConsentGcsDestination
        include Google::Apis::Core::Hashable
      
        # URI for a Cloud Storage directory where the server writes result files, in the
        # format `gs://`bucket-id`/`path/to/destination/dir``. If there is no trailing
        # slash, the service appends one when composing the object path. The user is
        # responsible for creating the Cloud Storage bucket and directory referenced in `
        # uri_prefix`.
        # Corresponds to the JSON property `uriPrefix`
        # @return [String]
        attr_accessor :uri_prefix
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @uri_prefix = args[:uri_prefix] if args.key?(:uri_prefix)
        end
      end
      
      # Represents a user's consent in terms of the resources that can be accessed and
      # under what conditions.
      class GoogleCloudHealthcareV1ConsentPolicy
        include Google::Apis::Core::Hashable
      
        # Represents a textual expression in the Common Expression Language (CEL) syntax.
        # CEL is a C-like expression language. The syntax and semantics of CEL are
        # documented at https://github.com/google/cel-spec. Example (Comparison): title:
        # "Summary size limit" description: "Determines if a summary is less than 100
        # chars" expression: "document.summary.size() < 100" Example (Equality): title: "
        # Requestor is owner" description: "Determines if requestor is the document
        # owner" expression: "document.owner == request.auth.claims.email" Example (
        # Logic): title: "Public documents" description: "Determine whether the document
        # should be publicly visible" expression: "document.type != 'private' &&
        # document.type != 'internal'" Example (Data Manipulation): title: "Notification
        # string" description: "Create a notification string with a timestamp."
        # expression: "'New message received at ' + string(document.create_time)" The
        # exact variables and functions that may be referenced within an expression are
        # determined by the service that evaluates it. See the service documentation for
        # additional information.
        # Corresponds to the JSON property `authorizationRule`
        # @return [Google::Apis::HealthcareV1::Expr]
        attr_accessor :authorization_rule
      
        # The resources that this policy applies to. A resource is a match if it matches
        # all the attributes listed here. If empty, this policy applies to all User data
        # mappings for the given user.
        # Corresponds to the JSON property `resourceAttributes`
        # @return [Array<Google::Apis::HealthcareV1::Attribute>]
        attr_accessor :resource_attributes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @authorization_rule = args[:authorization_rule] if args.key?(:authorization_rule)
          @resource_attributes = args[:resource_attributes] if args.key?(:resource_attributes)
        end
      end
      
      # Contains a summary of the DeidentifyDicomStore operation.
      class GoogleCloudHealthcareV1DeidentifyDeidentifyDicomStoreSummary
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Contains a summary of the DeidentifyFhirStore operation.
      class GoogleCloudHealthcareV1DeidentifyDeidentifyFhirStoreSummary
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # The BigQuery table where the server writes the output.
      class GoogleCloudHealthcareV1DicomBigQueryDestination
        include Google::Apis::Core::Hashable
      
        # Use `write_disposition` instead. If `write_disposition` is specified, this
        # parameter is ignored. force=false is equivalent to write_disposition=
        # WRITE_EMPTY and force=true is equivalent to write_disposition=WRITE_TRUNCATE.
        # Corresponds to the JSON property `force`
        # @return [Boolean]
        attr_accessor :force
        alias_method :force?, :force
      
        # BigQuery URI to a table, up to 2000 characters long, in the format `bq://
        # projectId.bqDatasetId.tableId`
        # Corresponds to the JSON property `tableUri`
        # @return [String]
        attr_accessor :table_uri
      
        # Determines whether the existing table in the destination is to be overwritten
        # or appended to. If a write_disposition is specified, the `force` parameter is
        # ignored.
        # Corresponds to the JSON property `writeDisposition`
        # @return [String]
        attr_accessor :write_disposition
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @force = args[:force] if args.key?(:force)
          @table_uri = args[:table_uri] if args.key?(:table_uri)
          @write_disposition = args[:write_disposition] if args.key?(:write_disposition)
        end
      end
      
      # The Cloud Storage location where the server writes the output and the export
      # configuration.
      class GoogleCloudHealthcareV1DicomGcsDestination
        include Google::Apis::Core::Hashable
      
        # MIME types supported by DICOM spec. Each file is written in the following
        # format: `.../`study_id`/`series_id`/`instance_id`[/`frame_number`].`extension``
        # The frame_number component exists only for multi-frame instances. Supported
        # MIME types are consistent with supported formats in DICOMweb: https://cloud.
        # google.com/healthcare/docs/dicom#retrieve_transaction. Specifically, the
        # following are supported: - application/dicom; transfer-syntax=1.2.840.10008.1.
        # 2.1 (uncompressed DICOM) - application/dicom; transfer-syntax=1.2.840.10008.1.
        # 2.4.50 (DICOM with embedded JPEG Baseline) - application/dicom; transfer-
        # syntax=1.2.840.10008.1.2.4.90 (DICOM with embedded JPEG 2000 Lossless Only) -
        # application/dicom; transfer-syntax=1.2.840.10008.1.2.4.91 (DICOM with embedded
        # JPEG 2000) - application/dicom; transfer-syntax=* (DICOM with no transcoding) -
        # application/octet-stream; transfer-syntax=1.2.840.10008.1.2.1 (raw
        # uncompressed PixelData) - application/octet-stream; transfer-syntax=* (raw
        # PixelData in whatever format it was uploaded in) - image/jpeg; transfer-syntax=
        # 1.2.840.10008.1.2.4.50 (Consumer JPEG) - image/png The following extensions
        # are used for output files: - application/dicom -> .dcm - image/jpeg -> .jpg -
        # image/png -> .png - application/octet-stream -> no extension If unspecified,
        # the instances are exported in the original DICOM format they were uploaded in.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        # The Cloud Storage destination to export to. URI for a Cloud Storage directory
        # where the server writes the result files, in the format `gs://`bucket-id`/`
        # path/to/destination/dir``). If there is no trailing slash, the service appends
        # one when composing the object path. The user is responsible for creating the
        # Cloud Storage bucket referenced in `uri_prefix`.
        # Corresponds to the JSON property `uriPrefix`
        # @return [String]
        attr_accessor :uri_prefix
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
          @uri_prefix = args[:uri_prefix] if args.key?(:uri_prefix)
        end
      end
      
      # Specifies the configuration for importing data from Cloud Storage.
      class GoogleCloudHealthcareV1DicomGcsSource
        include Google::Apis::Core::Hashable
      
        # Points to a Cloud Storage URI containing file(s) with content only. The URI
        # must be in the following format: `gs://`bucket_id`/`object_id``. The URI can
        # include wildcards in `object_id` and thus identify multiple files. Supported
        # wildcards: * '*' to match 0 or more non-separator characters * '**' to match 0
        # or more characters (including separators). Must be used at the end of a path
        # and with no other wildcards in the path. Can also be used with a file
        # extension (such as .dcm), which imports all files with the extension in the
        # specified directory and its sub-directories. For example, `gs://my-bucket/my-
        # directory/**.dcm` imports all files with .dcm extensions in `my-directory/`
        # and its sub-directories. * '?' to match 1 character. All other URI formats are
        # invalid. Files matching the wildcard are expected to contain content only, no
        # metadata.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # StreamConfig specifies configuration for a streaming DICOM export.
      class GoogleCloudHealthcareV1DicomStreamConfig
        include Google::Apis::Core::Hashable
      
        # The BigQuery table where the server writes the output.
        # Corresponds to the JSON property `bigqueryDestination`
        # @return [Google::Apis::HealthcareV1::GoogleCloudHealthcareV1DicomBigQueryDestination]
        attr_accessor :bigquery_destination
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bigquery_destination = args[:bigquery_destination] if args.key?(:bigquery_destination)
        end
      end
      
      # The configuration for exporting to BigQuery.
      class GoogleCloudHealthcareV1FhirBigQueryDestination
        include Google::Apis::Core::Hashable
      
        # BigQuery URI to an existing dataset, up to 2000 characters long, in the format
        # `bq://projectId.bqDatasetId`.
        # Corresponds to the JSON property `datasetUri`
        # @return [String]
        attr_accessor :dataset_uri
      
        # If this flag is `TRUE`, all tables are deleted from the dataset before the new
        # exported tables are written. If the flag is not set and the destination
        # dataset contains tables, the export call returns an error. If `
        # write_disposition` is specified, this parameter is ignored. force=false is
        # equivalent to write_disposition=WRITE_EMPTY and force=true is equivalent to
        # write_disposition=WRITE_TRUNCATE.
        # Corresponds to the JSON property `force`
        # @return [Boolean]
        attr_accessor :force
        alias_method :force?, :force
      
        # Configuration for the FHIR BigQuery schema. Determines how the server
        # generates the schema.
        # Corresponds to the JSON property `schemaConfig`
        # @return [Google::Apis::HealthcareV1::SchemaConfig]
        attr_accessor :schema_config
      
        # Determines if existing data in the destination dataset is overwritten,
        # appended to, or not written if the tables contain data. If a write_disposition
        # is specified, the `force` parameter is ignored.
        # Corresponds to the JSON property `writeDisposition`
        # @return [String]
        attr_accessor :write_disposition
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dataset_uri = args[:dataset_uri] if args.key?(:dataset_uri)
          @force = args[:force] if args.key?(:force)
          @schema_config = args[:schema_config] if args.key?(:schema_config)
          @write_disposition = args[:write_disposition] if args.key?(:write_disposition)
        end
      end
      
      # The configuration for exporting to Cloud Storage.
      class GoogleCloudHealthcareV1FhirGcsDestination
        include Google::Apis::Core::Hashable
      
        # URI for a Cloud Storage directory where result files should be written, in the
        # format of `gs://`bucket-id`/`path/to/destination/dir``. If there is no
        # trailing slash, the service appends one when composing the object path. The
        # user is responsible for creating the Cloud Storage bucket referenced in `
        # uri_prefix`.
        # Corresponds to the JSON property `uriPrefix`
        # @return [String]
        attr_accessor :uri_prefix
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @uri_prefix = args[:uri_prefix] if args.key?(:uri_prefix)
        end
      end
      
      # Specifies the configuration for importing data from Cloud Storage.
      class GoogleCloudHealthcareV1FhirGcsSource
        include Google::Apis::Core::Hashable
      
        # Points to a Cloud Storage URI containing file(s) to import. The URI must be in
        # the following format: `gs://`bucket_id`/`object_id``. The URI can include
        # wildcards in `object_id` and thus identify multiple files. Supported wildcards:
        # * `*` to match 0 or more non-separator characters * `**` to match 0 or more
        # characters (including separators). Must be used at the end of a path and with
        # no other wildcards in the path. Can also be used with a file extension (such
        # as .ndjson), which imports all files with the extension in the specified
        # directory and its sub-directories. For example, `gs://my-bucket/my-directory/**
        # .ndjson` imports all files with `.ndjson` extensions in `my-directory/` and
        # its sub-directories. * `?` to match 1 character Files matching the wildcard
        # are expected to contain content only, no metadata.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Construct representing a logical group or a segment.
      class GroupOrSegment
        include Google::Apis::Core::Hashable
      
        # An HL7v2 logical group construct.
        # Corresponds to the JSON property `group`
        # @return [Google::Apis::HealthcareV1::SchemaGroup]
        attr_accessor :group
      
        # An HL7v2 Segment.
        # Corresponds to the JSON property `segment`
        # @return [Google::Apis::HealthcareV1::SchemaSegment]
        attr_accessor :segment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @group = args[:group] if args.key?(:group)
          @segment = args[:segment] if args.key?(:segment)
        end
      end
      
      # Root config message for HL7v2 schema. This contains a schema structure of
      # groups and segments, and filters that determine which messages to apply the
      # schema structure to.
      class Hl7SchemaConfig
        include Google::Apis::Core::Hashable
      
        # Map from each HL7v2 message type and trigger event pair, such as ADT_A04, to
        # its schema configuration root group.
        # Corresponds to the JSON property `messageSchemaConfigs`
        # @return [Hash<String,Google::Apis::HealthcareV1::SchemaGroup>]
        attr_accessor :message_schema_configs
      
        # Each VersionSource is tested and only if they all match is the schema used for
        # the message.
        # Corresponds to the JSON property `version`
        # @return [Array<Google::Apis::HealthcareV1::VersionSource>]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @message_schema_configs = args[:message_schema_configs] if args.key?(:message_schema_configs)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Root config for HL7v2 datatype definitions for a specific HL7v2 version.
      class Hl7TypesConfig
        include Google::Apis::Core::Hashable
      
        # The HL7v2 type definitions.
        # Corresponds to the JSON property `type`
        # @return [Array<Google::Apis::HealthcareV1::Type>]
        attr_accessor :type
      
        # The version selectors that this config applies to. A message must match ALL
        # version sources to apply.
        # Corresponds to the JSON property `version`
        # @return [Array<Google::Apis::HealthcareV1::VersionSource>]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @type = args[:type] if args.key?(:type)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Specifies where and whether to send notifications upon changes to a data store.
      class Hl7V2NotificationConfig
        include Google::Apis::Core::Hashable
      
        # Restricts notifications sent for messages matching a filter. If this is empty,
        # all messages are matched. The following syntax is available: * A string field
        # value can be written as text inside quotation marks, for example `"query text"`
        # . The only valid relational operation for text fields is equality (`=`), where
        # text is searched within the field, rather than having the field be equal to
        # the text. For example, `"Comment = great"` returns messages with `great` in
        # the comment field. * A number field value can be written as an integer, a
        # decimal, or an exponential. The valid relational operators for number fields
        # are the equality operator (`=`), along with the less than/greater than
        # operators (`<`, `<=`, `>`, `>=`). Note that there is no inequality (`!=`)
        # operator. You can prepend the `NOT` operator to an expression to negate it. *
        # A date field value must be written in `yyyy-mm-dd` form. Fields with date and
        # time use the RFC3339 time format. Leading zeros are required for one-digit
        # months and days. The valid relational operators for date fields are the
        # equality operator (`=`) , along with the less than/greater than operators (`<`,
        # `<=`, `>`, `>=`). Note that there is no inequality (`!=`) operator. You can
        # prepend the `NOT` operator to an expression to negate it. * Multiple field
        # query expressions can be combined in one query by adding `AND` or `OR`
        # operators between the expressions. If a boolean operator appears within a
        # quoted string, it is not treated as special, it's just another part of the
        # character string to be matched. You can prepend the `NOT` operator to an
        # expression to negate it. The following fields and functions are available for
        # filtering: * `message_type`, from the MSH-9.1 field. For example, `NOT
        # message_type = "ADT"`. * `send_date` or `sendDate`, the YYYY-MM-DD date the
        # message was sent in the dataset's time_zone, from the MSH-7 segment. For
        # example, `send_date < "2017-01-02"`. * `send_time`, the timestamp when the
        # message was sent, using the RFC3339 time format for comparisons, from the MSH-
        # 7 segment. For example, `send_time < "2017-01-02T00:00:00-05:00"`. * `
        # create_time`, the timestamp when the message was created in the HL7v2 store.
        # Use the RFC3339 time format for comparisons. For example, `create_time < "2017-
        # 01-02T00:00:00-05:00"`. * `send_facility`, the care center that the message
        # came from, from the MSH-4 segment. For example, `send_facility = "ABC"`. * `
        # PatientId(value, type)`, which matches if the message lists a patient having
        # an ID of the given value and type in the PID-2, PID-3, or PID-4 segments. For
        # example, `PatientId("123456", "MRN")`. * `labels.x`, a string value of the
        # label with key `x` as set using the Message.labels map. For example, `labels."
        # priority"="high"`. The operator `:*` can be used to assert the existence of a
        # label. For example, `labels."priority":*`.
        # Corresponds to the JSON property `filter`
        # @return [String]
        attr_accessor :filter
      
        # The [Pub/Sub](https://cloud.google.com/pubsub/docs/) topic that notifications
        # of changes are published on. Supplied by the client. The notification is a `
        # PubsubMessage` with the following fields: * `PubsubMessage.Data` contains the
        # resource name. * `PubsubMessage.MessageId` is the ID of this notification. It'
        # s guaranteed to be unique within the topic. * `PubsubMessage.PublishTime` is
        # the time when the message was published. Note that notifications are only sent
        # if the topic is non-empty. [Topic names](https://cloud.google.com/pubsub/docs/
        # overview#names) must be scoped to a project. The Cloud Healthcare API service
        # account, service-PROJECT_NUMBER@gcp-sa-healthcare.iam.gserviceaccount.com,
        # must have publisher permissions on the given Pub/Sub topic. Not having
        # adequate permissions causes the calls that send notifications to fail. If a
        # notification cannot be published to Pub/Sub, errors are logged to Cloud
        # Logging. For more information, see [Viewing error logs in Cloud Logging](https:
        # //cloud.google.com/healthcare/docs/how-tos/logging)).
        # Corresponds to the JSON property `pubsubTopic`
        # @return [String]
        attr_accessor :pubsub_topic
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filter = args[:filter] if args.key?(:filter)
          @pubsub_topic = args[:pubsub_topic] if args.key?(:pubsub_topic)
        end
      end
      
      # Represents an HL7v2 store.
      class Hl7V2Store
        include Google::Apis::Core::Hashable
      
        # User-supplied key-value pairs used to organize HL7v2 stores. Label keys must
        # be between 1 and 63 characters long, have a UTF-8 encoding of maximum 128
        # bytes, and must conform to the following PCRE regular expression: \p`Ll`\p`Lo``
        # 0,62` Label values are optional, must be between 1 and 63 characters long,
        # have a UTF-8 encoding of maximum 128 bytes, and must conform to the following
        # PCRE regular expression: [\p`Ll`\p`Lo`\p`N`_-]`0,63` No more than 64 labels
        # can be associated with a given store.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Resource name of the HL7v2 store, of the form `projects/`project_id`/locations/
        # `location_id`/datasets/`dataset_id`/hl7V2Stores/`hl7v2_store_id``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # A list of notification configs. Each configuration uses a filter to determine
        # whether to publish a message (both Ingest & Create) on the corresponding
        # notification destination. Only the message name is sent as part of the
        # notification. Supplied by the client.
        # Corresponds to the JSON property `notificationConfigs`
        # @return [Array<Google::Apis::HealthcareV1::Hl7V2NotificationConfig>]
        attr_accessor :notification_configs
      
        # The configuration for the parser. It determines how the server parses the
        # messages.
        # Corresponds to the JSON property `parserConfig`
        # @return [Google::Apis::HealthcareV1::ParserConfig]
        attr_accessor :parser_config
      
        # Determines whether to reject duplicate messages. A duplicate message is a
        # message with the same raw bytes as a message that has already been ingested/
        # created in this HL7v2 store. The default value is false, meaning that the
        # store accepts the duplicate messages and it also returns the same ACK message
        # in the IngestMessageResponse as has been returned previously. Note that only
        # one resource is created in the store. When this field is set to true,
        # CreateMessage/IngestMessage requests with a duplicate message will be rejected
        # by the store, and IngestMessageErrorDetail returns a NACK message upon
        # rejection.
        # Corresponds to the JSON property `rejectDuplicateMessage`
        # @return [Boolean]
        attr_accessor :reject_duplicate_message
        alias_method :reject_duplicate_message?, :reject_duplicate_message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
          @notification_configs = args[:notification_configs] if args.key?(:notification_configs)
          @parser_config = args[:parser_config] if args.key?(:parser_config)
          @reject_duplicate_message = args[:reject_duplicate_message] if args.key?(:reject_duplicate_message)
        end
      end
      
      # Message that represents an arbitrary HTTP body. It should only be used for
      # payload formats that can't be represented as JSON, such as raw binary or an
      # HTML page. This message can be used both in streaming and non-streaming API
      # methods in the request as well as the response. It can be used as a top-level
      # request field, which is convenient if one wants to extract parameters from
      # either the URL or HTTP template into the request fields and also want access
      # to the raw HTTP body. Example: message GetResourceRequest ` // A unique
      # request id. string request_id = 1; // The raw HTTP body is bound to this field.
      # google.api.HttpBody http_body = 2; ` service ResourceService ` rpc
      # GetResource(GetResourceRequest) returns (google.api.HttpBody); rpc
      # UpdateResource(google.api.HttpBody) returns (google.protobuf.Empty); ` Example
      # with streaming methods: service CaldavService ` rpc GetCalendar(stream google.
      # api.HttpBody) returns (stream google.api.HttpBody); rpc UpdateCalendar(stream
      # google.api.HttpBody) returns (stream google.api.HttpBody); ` Use of this type
      # only changes how the request and response bodies are handled, all other
      # features will continue to work unchanged.
      class HttpBody
        include Google::Apis::Core::Hashable
      
        # The HTTP Content-Type header value specifying the content type of the body.
        # Corresponds to the JSON property `contentType`
        # @return [String]
        attr_accessor :content_type
      
        # The HTTP request/response body as raw binary.
        # Corresponds to the JSON property `data`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :data
      
        # Application specific response metadata. Must be set in the first response for
        # streaming APIs.
        # Corresponds to the JSON property `extensions`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :extensions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_type = args[:content_type] if args.key?(:content_type)
          @data = args[:data] if args.key?(:data)
          @extensions = args[:extensions] if args.key?(:extensions)
        end
      end
      
      # Raw bytes representing consent artifact content.
      class Image
        include Google::Apis::Core::Hashable
      
        # Input only. Points to a Cloud Storage URI containing the consent artifact
        # content. The URI must be in the following format: `gs://`bucket_id`/`object_id`
        # `. The Cloud Healthcare API service account must have the `roles/storage.
        # objectViewer` Cloud IAM role for this Cloud Storage location. The consent
        # artifact content at this URI is copied to a Cloud Storage location managed by
        # the Cloud Healthcare API. Responses to fetching requests return the consent
        # artifact content in raw_bytes.
        # Corresponds to the JSON property `gcsUri`
        # @return [String]
        attr_accessor :gcs_uri
      
        # Consent artifact content represented as a stream of bytes. This field is
        # populated when returned in GetConsentArtifact response, but not included in
        # CreateConsentArtifact and ListConsentArtifact response.
        # Corresponds to the JSON property `rawBytes`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :raw_bytes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gcs_uri = args[:gcs_uri] if args.key?(:gcs_uri)
          @raw_bytes = args[:raw_bytes] if args.key?(:raw_bytes)
        end
      end
      
      # Specifies how to handle de-identification of image pixels.
      class ImageConfig
        include Google::Apis::Core::Hashable
      
        # Determines how to redact text from image.
        # Corresponds to the JSON property `textRedactionMode`
        # @return [String]
        attr_accessor :text_redaction_mode
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @text_redaction_mode = args[:text_redaction_mode] if args.key?(:text_redaction_mode)
        end
      end
      
      # Imports data into the specified DICOM store. Returns an error if any of the
      # files to import are not DICOM files. This API accepts duplicate DICOM
      # instances by ignoring the newly-pushed instance. It does not overwrite.
      class ImportDicomDataRequest
        include Google::Apis::Core::Hashable
      
        # Specifies the configuration for importing data from Cloud Storage.
        # Corresponds to the JSON property `gcsSource`
        # @return [Google::Apis::HealthcareV1::GoogleCloudHealthcareV1DicomGcsSource]
        attr_accessor :gcs_source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gcs_source = args[:gcs_source] if args.key?(:gcs_source)
        end
      end
      
      # Returns additional information in regards to a completed DICOM store import.
      class ImportDicomDataResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Request to import messages.
      class ImportMessagesRequest
        include Google::Apis::Core::Hashable
      
        # Specifies the configuration for importing data from Cloud Storage.
        # Corresponds to the JSON property `gcsSource`
        # @return [Google::Apis::HealthcareV1::GcsSource]
        attr_accessor :gcs_source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gcs_source = args[:gcs_source] if args.key?(:gcs_source)
        end
      end
      
      # Final response of importing messages. This structure is included in the
      # response to describe the detailed outcome. It is only included when the
      # operation finishes successfully.
      class ImportMessagesResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Request to import resources.
      class ImportResourcesRequest
        include Google::Apis::Core::Hashable
      
        # The content structure in the source location. If not specified, the server
        # treats the input source files as BUNDLE.
        # Corresponds to the JSON property `contentStructure`
        # @return [String]
        attr_accessor :content_structure
      
        # Specifies the configuration for importing data from Cloud Storage.
        # Corresponds to the JSON property `gcsSource`
        # @return [Google::Apis::HealthcareV1::GoogleCloudHealthcareV1FhirGcsSource]
        attr_accessor :gcs_source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_structure = args[:content_structure] if args.key?(:content_structure)
          @gcs_source = args[:gcs_source] if args.key?(:gcs_source)
        end
      end
      
      # Final response of importing resources. This structure is included in the
      # response to describe the detailed outcome after the operation finishes
      # successfully.
      class ImportResourcesResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # A transformation to apply to text that is identified as a specific info_type.
      class InfoTypeTransformation
        include Google::Apis::Core::Hashable
      
        # Mask a string by replacing its characters with a fixed character.
        # Corresponds to the JSON property `characterMaskConfig`
        # @return [Google::Apis::HealthcareV1::CharacterMaskConfig]
        attr_accessor :character_mask_config
      
        # Pseudonymization method that generates surrogates via cryptographic hashing.
        # Uses SHA-256. Outputs a base64-encoded representation of the hashed output (
        # for example, `L7k0BHmF1ha5U3NfGykjro4xWi1MPVQPjhMAZbSV9mM=`).
        # Corresponds to the JSON property `cryptoHashConfig`
        # @return [Google::Apis::HealthcareV1::CryptoHashConfig]
        attr_accessor :crypto_hash_config
      
        # Shift a date forward or backward in time by a random amount which is
        # consistent for a given patient and crypto key combination.
        # Corresponds to the JSON property `dateShiftConfig`
        # @return [Google::Apis::HealthcareV1::DateShiftConfig]
        attr_accessor :date_shift_config
      
        # InfoTypes to apply this transformation to. If this is not specified, the
        # transformation applies to any info_type.
        # Corresponds to the JSON property `infoTypes`
        # @return [Array<String>]
        attr_accessor :info_types
      
        # Define how to redact sensitive values. Default behaviour is erase. For example,
        # "My name is Jane." becomes "My name is ."
        # Corresponds to the JSON property `redactConfig`
        # @return [Google::Apis::HealthcareV1::RedactConfig]
        attr_accessor :redact_config
      
        # When using the INSPECT_AND_TRANSFORM action, each match is replaced with the
        # name of the info_type. For example, "My name is Jane" becomes "My name is [
        # PERSON_NAME]." The TRANSFORM action is equivalent to redacting.
        # Corresponds to the JSON property `replaceWithInfoTypeConfig`
        # @return [Google::Apis::HealthcareV1::ReplaceWithInfoTypeConfig]
        attr_accessor :replace_with_info_type_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @character_mask_config = args[:character_mask_config] if args.key?(:character_mask_config)
          @crypto_hash_config = args[:crypto_hash_config] if args.key?(:crypto_hash_config)
          @date_shift_config = args[:date_shift_config] if args.key?(:date_shift_config)
          @info_types = args[:info_types] if args.key?(:info_types)
          @redact_config = args[:redact_config] if args.key?(:redact_config)
          @replace_with_info_type_config = args[:replace_with_info_type_config] if args.key?(:replace_with_info_type_config)
        end
      end
      
      # Ingests a message into the specified HL7v2 store.
      class IngestMessageRequest
        include Google::Apis::Core::Hashable
      
        # A complete HL7v2 message. See [Introduction to HL7 Standards] (https://www.hl7.
        # org/implement/standards/index.cfm?ref=common) for details on the standard.
        # Corresponds to the JSON property `message`
        # @return [Google::Apis::HealthcareV1::Message]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # Acknowledges that a message has been ingested into the specified HL7v2 store.
      class IngestMessageResponse
        include Google::Apis::Core::Hashable
      
        # HL7v2 ACK message.
        # Corresponds to the JSON property `hl7Ack`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :hl7_ack
      
        # A complete HL7v2 message. See [Introduction to HL7 Standards] (https://www.hl7.
        # org/implement/standards/index.cfm?ref=common) for details on the standard.
        # Corresponds to the JSON property `message`
        # @return [Google::Apis::HealthcareV1::Message]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @hl7_ack = args[:hl7_ack] if args.key?(:hl7_ack)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # Include to use an existing data crypto key wrapped by KMS. The wrapped key
      # must be a 128-, 192-, or 256-bit key. The key must grant the Cloud IAM
      # permission `cloudkms.cryptoKeyVersions.useToDecrypt` to the project's Cloud
      # Healthcare Service Agent service account. For more information, see [Creating
      # a wrapped key] (https://cloud.google.com/dlp/docs/create-wrapped-key).
      class KmsWrappedCryptoKey
        include Google::Apis::Core::Hashable
      
        # Required. The resource name of the KMS CryptoKey to use for unwrapping. For
        # example, `projects/`project_id`/locations/`location_id`/keyRings/`keyring`/
        # cryptoKeys/`key``.
        # Corresponds to the JSON property `cryptoKey`
        # @return [String]
        attr_accessor :crypto_key
      
        # Required. The wrapped data crypto key.
        # Corresponds to the JSON property `wrappedKey`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :wrapped_key
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @crypto_key = args[:crypto_key] if args.key?(:crypto_key)
          @wrapped_key = args[:wrapped_key] if args.key?(:wrapped_key)
        end
      end
      
      # EntityMentions can be linked to multiple entities using a LinkedEntity message
      # lets us add other fields, e.g. confidence.
      class LinkedEntity
        include Google::Apis::Core::Hashable
      
        # entity_id is a concept unique identifier. These are prefixed by a string that
        # identifies the entity coding system, followed by the unique identifier within
        # that system. For example, "UMLS/C0000970". This also supports ad hoc entities,
        # which are formed by normalizing entity mention content.
        # Corresponds to the JSON property `entityId`
        # @return [String]
        attr_accessor :entity_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entity_id = args[:entity_id] if args.key?(:entity_id)
        end
      end
      
      # 
      class ListAttributeDefinitionsResponse
        include Google::Apis::Core::Hashable
      
        # The returned Attribute definitions. The maximum number of attributes returned
        # is determined by the value of page_size in the ListAttributeDefinitionsRequest.
        # Corresponds to the JSON property `attributeDefinitions`
        # @return [Array<Google::Apis::HealthcareV1::AttributeDefinition>]
        attr_accessor :attribute_definitions
      
        # Token to retrieve the next page of results, or empty if there are no more
        # results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attribute_definitions = args[:attribute_definitions] if args.key?(:attribute_definitions)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # 
      class ListConsentArtifactsResponse
        include Google::Apis::Core::Hashable
      
        # The returned Consent artifacts. The maximum number of artifacts returned is
        # determined by the value of page_size in the ListConsentArtifactsRequest.
        # Corresponds to the JSON property `consentArtifacts`
        # @return [Array<Google::Apis::HealthcareV1::ConsentArtifact>]
        attr_accessor :consent_artifacts
      
        # Token to retrieve the next page of results, or empty if there are no more
        # results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consent_artifacts = args[:consent_artifacts] if args.key?(:consent_artifacts)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # 
      class ListConsentRevisionsResponse
        include Google::Apis::Core::Hashable
      
        # The returned Consent revisions. The maximum number of revisions returned is
        # determined by the value of `page_size` in the ListConsentRevisionsRequest.
        # Corresponds to the JSON property `consents`
        # @return [Array<Google::Apis::HealthcareV1::Consent>]
        attr_accessor :consents
      
        # Token to retrieve the next page of results, or empty if there are no more
        # results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consents = args[:consents] if args.key?(:consents)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # 
      class ListConsentStoresResponse
        include Google::Apis::Core::Hashable
      
        # The returned consent stores. The maximum number of stores returned is
        # determined by the value of page_size in the ListConsentStoresRequest.
        # Corresponds to the JSON property `consentStores`
        # @return [Array<Google::Apis::HealthcareV1::ConsentStore>]
        attr_accessor :consent_stores
      
        # Token to retrieve the next page of results, or empty if there are no more
        # results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consent_stores = args[:consent_stores] if args.key?(:consent_stores)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # 
      class ListConsentsResponse
        include Google::Apis::Core::Hashable
      
        # The returned Consents. The maximum number of Consents returned is determined
        # by the value of page_size in the ListConsentsRequest.
        # Corresponds to the JSON property `consents`
        # @return [Array<Google::Apis::HealthcareV1::Consent>]
        attr_accessor :consents
      
        # Token to retrieve the next page of results, or empty if there are no more
        # results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consents = args[:consents] if args.key?(:consents)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Lists the available datasets.
      class ListDatasetsResponse
        include Google::Apis::Core::Hashable
      
        # The first page of datasets.
        # Corresponds to the JSON property `datasets`
        # @return [Array<Google::Apis::HealthcareV1::Dataset>]
        attr_accessor :datasets
      
        # Token to retrieve the next page of results, or empty if there are no more
        # results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @datasets = args[:datasets] if args.key?(:datasets)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Lists the DICOM stores in the given dataset.
      class ListDicomStoresResponse
        include Google::Apis::Core::Hashable
      
        # The returned DICOM stores. Won't be more DICOM stores than the value of
        # page_size in the request.
        # Corresponds to the JSON property `dicomStores`
        # @return [Array<Google::Apis::HealthcareV1::DicomStore>]
        attr_accessor :dicom_stores
      
        # Token to retrieve the next page of results or empty if there are no more
        # results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dicom_stores = args[:dicom_stores] if args.key?(:dicom_stores)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Lists the FHIR stores in the given dataset.
      class ListFhirStoresResponse
        include Google::Apis::Core::Hashable
      
        # The returned FHIR stores. Won't be more FHIR stores than the value of
        # page_size in the request.
        # Corresponds to the JSON property `fhirStores`
        # @return [Array<Google::Apis::HealthcareV1::FhirStore>]
        attr_accessor :fhir_stores
      
        # Token to retrieve the next page of results or empty if there are no more
        # results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fhir_stores = args[:fhir_stores] if args.key?(:fhir_stores)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Lists the HL7v2 stores in the given dataset.
      class ListHl7V2StoresResponse
        include Google::Apis::Core::Hashable
      
        # The returned HL7v2 stores. Won't be more HL7v2 stores than the value of
        # page_size in the request.
        # Corresponds to the JSON property `hl7V2Stores`
        # @return [Array<Google::Apis::HealthcareV1::Hl7V2Store>]
        attr_accessor :hl7_v2_stores
      
        # Token to retrieve the next page of results or empty if there are no more
        # results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @hl7_v2_stores = args[:hl7_v2_stores] if args.key?(:hl7_v2_stores)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The response message for Locations.ListLocations.
      class ListLocationsResponse
        include Google::Apis::Core::Hashable
      
        # A list of locations that matches the specified filter in the request.
        # Corresponds to the JSON property `locations`
        # @return [Array<Google::Apis::HealthcareV1::Location>]
        attr_accessor :locations
      
        # The standard List next-page token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @locations = args[:locations] if args.key?(:locations)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Lists the messages in the specified HL7v2 store.
      class ListMessagesResponse
        include Google::Apis::Core::Hashable
      
        # The returned Messages. Won't be more Messages than the value of page_size in
        # the request. See view for populated fields.
        # Corresponds to the JSON property `hl7V2Messages`
        # @return [Array<Google::Apis::HealthcareV1::Message>]
        attr_accessor :hl7_v2_messages
      
        # Token to retrieve the next page of results or empty if there are no more
        # results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @hl7_v2_messages = args[:hl7_v2_messages] if args.key?(:hl7_v2_messages)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The response message for Operations.ListOperations.
      class ListOperationsResponse
        include Google::Apis::Core::Hashable
      
        # The standard List next-page token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # A list of operations that matches the specified filter in the request.
        # Corresponds to the JSON property `operations`
        # @return [Array<Google::Apis::HealthcareV1::Operation>]
        attr_accessor :operations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @operations = args[:operations] if args.key?(:operations)
        end
      end
      
      # 
      class ListUserDataMappingsResponse
        include Google::Apis::Core::Hashable
      
        # Token to retrieve the next page of results, or empty if there are no more
        # results in the list.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The returned User data mappings. The maximum number of User data mappings
        # returned is determined by the value of page_size in the
        # ListUserDataMappingsRequest.
        # Corresponds to the JSON property `userDataMappings`
        # @return [Array<Google::Apis::HealthcareV1::UserDataMapping>]
        attr_accessor :user_data_mappings
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @user_data_mappings = args[:user_data_mappings] if args.key?(:user_data_mappings)
        end
      end
      
      # A resource that represents a Google Cloud location.
      class Location
        include Google::Apis::Core::Hashable
      
        # The friendly name for this location, typically a nearby city name. For example,
        # "Tokyo".
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # Cross-service attributes for the location. For example `"cloud.googleapis.com/
        # region": "us-east1"`
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # The canonical id for this location. For example: `"us-east1"`.
        # Corresponds to the JSON property `locationId`
        # @return [String]
        attr_accessor :location_id
      
        # Service-specific metadata. For example the available capacity at the given
        # location.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # Resource name for the location, which may vary between implementations. For
        # example: `"projects/example-project/locations/us-east1"`
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @labels = args[:labels] if args.key?(:labels)
          @location_id = args[:location_id] if args.key?(:location_id)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # A complete HL7v2 message. See [Introduction to HL7 Standards] (https://www.hl7.
      # org/implement/standards/index.cfm?ref=common) for details on the standard.
      class Message
        include Google::Apis::Core::Hashable
      
        # Output only. The datetime when the message was created. Set by the server.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Raw message bytes.
        # Corresponds to the JSON property `data`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :data
      
        # User-supplied key-value pairs used to organize HL7v2 stores. Label keys must
        # be between 1 and 63 characters long, have a UTF-8 encoding of maximum 128
        # bytes, and must conform to the following PCRE regular expression: \p`Ll`\p`Lo``
        # 0,62` Label values are optional, must be between 1 and 63 characters long,
        # have a UTF-8 encoding of maximum 128 bytes, and must conform to the following
        # PCRE regular expression: [\p`Ll`\p`Lo`\p`N`_-]`0,63` No more than 64 labels
        # can be associated with a given store.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # The message type for this message. MSH-9.1.
        # Corresponds to the JSON property `messageType`
        # @return [String]
        attr_accessor :message_type
      
        # Resource name of the Message, of the form `projects/`project_id`/locations/`
        # location_id`/datasets/`dataset_id`/hl7V2Stores/`hl7_v2_store_id`/messages/`
        # message_id``. Assigned by the server.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The content of a HL7v2 message in a structured format.
        # Corresponds to the JSON property `parsedData`
        # @return [Google::Apis::HealthcareV1::ParsedData]
        attr_accessor :parsed_data
      
        # All patient IDs listed in the PID-2, PID-3, and PID-4 segments of this message.
        # Corresponds to the JSON property `patientIds`
        # @return [Array<Google::Apis::HealthcareV1::PatientId>]
        attr_accessor :patient_ids
      
        # The content of an HL7v2 message in a structured format as specified by a
        # schema.
        # Corresponds to the JSON property `schematizedData`
        # @return [Google::Apis::HealthcareV1::SchematizedData]
        attr_accessor :schematized_data
      
        # The hospital that this message came from. MSH-4.
        # Corresponds to the JSON property `sendFacility`
        # @return [String]
        attr_accessor :send_facility
      
        # The datetime the sending application sent this message. MSH-7.
        # Corresponds to the JSON property `sendTime`
        # @return [String]
        attr_accessor :send_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @data = args[:data] if args.key?(:data)
          @labels = args[:labels] if args.key?(:labels)
          @message_type = args[:message_type] if args.key?(:message_type)
          @name = args[:name] if args.key?(:name)
          @parsed_data = args[:parsed_data] if args.key?(:parsed_data)
          @patient_ids = args[:patient_ids] if args.key?(:patient_ids)
          @schematized_data = args[:schematized_data] if args.key?(:schematized_data)
          @send_facility = args[:send_facility] if args.key?(:send_facility)
          @send_time = args[:send_time] if args.key?(:send_time)
        end
      end
      
      # Specifies where to send notifications upon changes to a data store.
      class NotificationConfig
        include Google::Apis::Core::Hashable
      
        # The [Pub/Sub](https://cloud.google.com/pubsub/docs/) topic that notifications
        # of changes are published on. Supplied by the client. PubsubMessage.Data
        # contains the resource name. PubsubMessage.MessageId is the ID of this message.
        # It is guaranteed to be unique within the topic. PubsubMessage.PublishTime is
        # the time at which the message was published. Notifications are only sent if
        # the topic is non-empty. [Topic names](https://cloud.google.com/pubsub/docs/
        # overview#names) must be scoped to a project. Cloud Healthcare API service
        # account must have publisher permissions on the given Pub/Sub topic. Not having
        # adequate permissions causes the calls that send notifications to fail. If a
        # notification can't be published to Pub/Sub, errors are logged to Cloud Logging
        # (see [Viewing error logs in Cloud Logging](https://cloud.google.com/healthcare/
        # docs/how-tos/logging)). If the number of errors exceeds a certain rate, some
        # aren't submitted. Note that not all operations trigger notifications, see [
        # Configuring Pub/Sub notifications](https://cloud.google.com/healthcare/docs/
        # how-tos/pubsub) for specific details.
        # Corresponds to the JSON property `pubsubTopic`
        # @return [String]
        attr_accessor :pubsub_topic
      
        # Indicates whether or not to send Pub/Sub notifications on bulk import. Only
        # supported for DICOM imports.
        # Corresponds to the JSON property `sendForBulkImport`
        # @return [Boolean]
        attr_accessor :send_for_bulk_import
        alias_method :send_for_bulk_import?, :send_for_bulk_import
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @pubsub_topic = args[:pubsub_topic] if args.key?(:pubsub_topic)
          @send_for_bulk_import = args[:send_for_bulk_import] if args.key?(:send_for_bulk_import)
        end
      end
      
      # This resource represents a long-running operation that is the result of a
      # network API call.
      class Operation
        include Google::Apis::Core::Hashable
      
        # If the value is `false`, it means the operation is still in progress. If `true`
        # , the operation is completed, and either `error` or `response` is available.
        # Corresponds to the JSON property `done`
        # @return [Boolean]
        attr_accessor :done
        alias_method :done?, :done
      
        # The `Status` type defines a logical error model that is suitable for different
        # programming environments, including REST APIs and RPC APIs. It is used by [
        # gRPC](https://github.com/grpc). Each `Status` message contains three pieces of
        # data: error code, error message, and error details. You can find out more
        # about this error model and how to work with it in the [API Design Guide](https:
        # //cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::HealthcareV1::Status]
        attr_accessor :error
      
        # Service-specific metadata associated with the operation. It typically contains
        # progress information and common metadata such as create time. Some services
        # might not provide such metadata. Any method that returns a long-running
        # operation should document the metadata type, if any.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # The server-assigned name, which is only unique within the same service that
        # originally returns it. If you use the default HTTP mapping, the `name` should
        # be a resource name ending with `operations/`unique_id``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The normal, successful response of the operation. If the original method
        # returns no data on success, such as `Delete`, the response is `google.protobuf.
        # Empty`. If the original method is standard `Get`/`Create`/`Update`, the
        # response should be the resource. For other methods, the response should have
        # the type `XxxResponse`, where `Xxx` is the original method name. For example,
        # if the original method name is `TakeSnapshot()`, the inferred response type is
        # `TakeSnapshotResponse`.
        # Corresponds to the JSON property `response`
        # @return [Hash<String,Object>]
        attr_accessor :response
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @done = args[:done] if args.key?(:done)
          @error = args[:error] if args.key?(:error)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
          @response = args[:response] if args.key?(:response)
        end
      end
      
      # OperationMetadata provides information about the operation execution. Returned
      # in the long-running operation's metadata field.
      class OperationMetadata
        include Google::Apis::Core::Hashable
      
        # The name of the API method that initiated the operation.
        # Corresponds to the JSON property `apiMethodName`
        # @return [String]
        attr_accessor :api_method_name
      
        # Specifies if cancellation was requested for the operation.
        # Corresponds to the JSON property `cancelRequested`
        # @return [Boolean]
        attr_accessor :cancel_requested
        alias_method :cancel_requested?, :cancel_requested
      
        # ProgressCounter provides counters to describe an operation's progress.
        # Corresponds to the JSON property `counter`
        # @return [Google::Apis::HealthcareV1::ProgressCounter]
        attr_accessor :counter
      
        # The time at which the operation was created by the API.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # The time at which execution was completed.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # A link to audit and error logs in the log viewer. Error logs are generated
        # only by some operations, listed at [Viewing error logs in Cloud Logging](https:
        # //cloud.google.com/healthcare/docs/how-tos/logging).
        # Corresponds to the JSON property `logsUrl`
        # @return [String]
        attr_accessor :logs_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_method_name = args[:api_method_name] if args.key?(:api_method_name)
          @cancel_requested = args[:cancel_requested] if args.key?(:cancel_requested)
          @counter = args[:counter] if args.key?(:counter)
          @create_time = args[:create_time] if args.key?(:create_time)
          @end_time = args[:end_time] if args.key?(:end_time)
          @logs_url = args[:logs_url] if args.key?(:logs_url)
        end
      end
      
      # The content of a HL7v2 message in a structured format.
      class ParsedData
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `segments`
        # @return [Array<Google::Apis::HealthcareV1::Segment>]
        attr_accessor :segments
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @segments = args[:segments] if args.key?(:segments)
        end
      end
      
      # The configuration for the parser. It determines how the server parses the
      # messages.
      class ParserConfig
        include Google::Apis::Core::Hashable
      
        # Determines whether messages with no header are allowed.
        # Corresponds to the JSON property `allowNullHeader`
        # @return [Boolean]
        attr_accessor :allow_null_header
        alias_method :allow_null_header?, :allow_null_header
      
        # A schema package contains a set of schemas and type definitions.
        # Corresponds to the JSON property `schema`
        # @return [Google::Apis::HealthcareV1::SchemaPackage]
        attr_accessor :schema
      
        # Byte(s) to use as the segment terminator. If this is unset, '\r' is used as
        # segment terminator, matching the HL7 version 2 specification.
        # Corresponds to the JSON property `segmentTerminator`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :segment_terminator
      
        # Immutable. Determines the version of both the default parser to be used when `
        # schema` is not given, as well as the schematized parser used when `schema` is
        # specified. This field is immutable after HL7v2 store creation.
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allow_null_header = args[:allow_null_header] if args.key?(:allow_null_header)
          @schema = args[:schema] if args.key?(:schema)
          @segment_terminator = args[:segment_terminator] if args.key?(:segment_terminator)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # A patient identifier and associated type.
      class PatientId
        include Google::Apis::Core::Hashable
      
        # ID type. For example, MRN or NHS.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        # The patient's unique identifier.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @type = args[:type] if args.key?(:type)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # An Identity and Access Management (IAM) policy, which specifies access
      # controls for Google Cloud resources. A `Policy` is a collection of `bindings`.
      # A `binding` binds one or more `members`, or principals, to a single `role`.
      # Principals can be user accounts, service accounts, Google groups, and domains (
      # such as G Suite). A `role` is a named list of permissions; each `role` can be
      # an IAM predefined role or a user-created custom role. For some types of Google
      # Cloud resources, a `binding` can also specify a `condition`, which is a
      # logical expression that allows access to a resource only if the expression
      # evaluates to `true`. A condition can add constraints based on attributes of
      # the request, the resource, or both. To learn which resources support
      # conditions in their IAM policies, see the [IAM documentation](https://cloud.
      # google.com/iam/help/conditions/resource-policies). **JSON example:** ``` ` "
      # bindings": [ ` "role": "roles/resourcemanager.organizationAdmin", "members": [
      # "user:mike@example.com", "group:admins@example.com", "domain:google.com", "
      # serviceAccount:my-project-id@appspot.gserviceaccount.com" ] `, ` "role": "
      # roles/resourcemanager.organizationViewer", "members": [ "user:eve@example.com"
      # ], "condition": ` "title": "expirable access", "description": "Does not grant
      # access after Sep 2020", "expression": "request.time < timestamp('2020-10-01T00:
      # 00:00.000Z')", ` ` ], "etag": "BwWWja0YfJA=", "version": 3 ` ``` **YAML
      # example:** ``` bindings: - members: - user:mike@example.com - group:admins@
      # example.com - domain:google.com - serviceAccount:my-project-id@appspot.
      # gserviceaccount.com role: roles/resourcemanager.organizationAdmin - members: -
      # user:eve@example.com role: roles/resourcemanager.organizationViewer condition:
      # title: expirable access description: Does not grant access after Sep 2020
      # expression: request.time < timestamp('2020-10-01T00:00:00.000Z') etag:
      # BwWWja0YfJA= version: 3 ``` For a description of IAM and its features, see the
      # [IAM documentation](https://cloud.google.com/iam/docs/).
      class Policy
        include Google::Apis::Core::Hashable
      
        # Specifies cloud audit logging configuration for this policy.
        # Corresponds to the JSON property `auditConfigs`
        # @return [Array<Google::Apis::HealthcareV1::AuditConfig>]
        attr_accessor :audit_configs
      
        # Associates a list of `members`, or principals, with a `role`. Optionally, may
        # specify a `condition` that determines how and when the `bindings` are applied.
        # Each of the `bindings` must contain at least one principal. The `bindings` in
        # a `Policy` can refer to up to 1,500 principals; up to 250 of these principals
        # can be Google groups. Each occurrence of a principal counts towards these
        # limits. For example, if the `bindings` grant 50 different roles to `user:alice@
        # example.com`, and not to any other principal, then you can add another 1,450
        # principals to the `bindings` in the `Policy`.
        # Corresponds to the JSON property `bindings`
        # @return [Array<Google::Apis::HealthcareV1::Binding>]
        attr_accessor :bindings
      
        # `etag` is used for optimistic concurrency control as a way to help prevent
        # simultaneous updates of a policy from overwriting each other. It is strongly
        # suggested that systems make use of the `etag` in the read-modify-write cycle
        # to perform policy updates in order to avoid race conditions: An `etag` is
        # returned in the response to `getIamPolicy`, and systems are expected to put
        # that etag in the request to `setIamPolicy` to ensure that their change will be
        # applied to the same version of the policy. **Important:** If you use IAM
        # Conditions, you must include the `etag` field whenever you call `setIamPolicy`.
        # If you omit this field, then IAM allows you to overwrite a version `3` policy
        # with a version `1` policy, and all of the conditions in the version `3` policy
        # are lost.
        # Corresponds to the JSON property `etag`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :etag
      
        # Specifies the format of the policy. Valid values are `0`, `1`, and `3`.
        # Requests that specify an invalid value are rejected. Any operation that
        # affects conditional role bindings must specify version `3`. This requirement
        # applies to the following operations: * Getting a policy that includes a
        # conditional role binding * Adding a conditional role binding to a policy *
        # Changing a conditional role binding in a policy * Removing any role binding,
        # with or without a condition, from a policy that includes conditions **
        # Important:** If you use IAM Conditions, you must include the `etag` field
        # whenever you call `setIamPolicy`. If you omit this field, then IAM allows you
        # to overwrite a version `3` policy with a version `1` policy, and all of the
        # conditions in the version `3` policy are lost. If a policy does not include
        # any conditions, operations on that policy may specify any valid version or
        # leave the field unset. To learn which resources support conditions in their
        # IAM policies, see the [IAM documentation](https://cloud.google.com/iam/help/
        # conditions/resource-policies).
        # Corresponds to the JSON property `version`
        # @return [Fixnum]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audit_configs = args[:audit_configs] if args.key?(:audit_configs)
          @bindings = args[:bindings] if args.key?(:bindings)
          @etag = args[:etag] if args.key?(:etag)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # ProgressCounter provides counters to describe an operation's progress.
      class ProgressCounter
        include Google::Apis::Core::Hashable
      
        # The number of units that failed in the operation.
        # Corresponds to the JSON property `failure`
        # @return [Fixnum]
        attr_accessor :failure
      
        # The number of units that are pending in the operation.
        # Corresponds to the JSON property `pending`
        # @return [Fixnum]
        attr_accessor :pending
      
        # The number of units that succeeded in the operation.
        # Corresponds to the JSON property `success`
        # @return [Fixnum]
        attr_accessor :success
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @failure = args[:failure] if args.key?(:failure)
          @pending = args[:pending] if args.key?(:pending)
          @success = args[:success] if args.key?(:success)
        end
      end
      
      # The Pub/Sub output destination. The Cloud Healthcare Service Agent requires
      # the `roles/pubsub.publisher` Cloud IAM role on the Pub/Sub topic.
      class PubsubDestination
        include Google::Apis::Core::Hashable
      
        # The [Pub/Sub](https://cloud.google.com/pubsub/docs/) topic that Pub/Sub
        # messages are published on. Supplied by the client. The `PubsubMessage`
        # contains the following fields: * `PubsubMessage.Data` contains the resource
        # name. * `PubsubMessage.MessageId` is the ID of this notification. It is
        # guaranteed to be unique within the topic. * `PubsubMessage.PublishTime` is the
        # time when the message was published. [Topic names](https://cloud.google.com/
        # pubsub/docs/overview#names) must be scoped to a project. The Cloud Healthcare
        # API service account, service-PROJECT_NUMBER@gcp-sa-healthcare.iam.
        # gserviceaccount.com, must have publisher permissions on the given Pub/Sub
        # topic. Not having adequate permissions causes the calls that send
        # notifications to fail.
        # Corresponds to the JSON property `pubsubTopic`
        # @return [String]
        attr_accessor :pubsub_topic
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @pubsub_topic = args[:pubsub_topic] if args.key?(:pubsub_topic)
        end
      end
      
      # Queries all data_ids that are consented for a given use in the given consent
      # store and writes them to a specified destination. The returned Operation
      # includes a progress counter for the number of User data mappings processed.
      # Errors are logged to Cloud Logging (see [Viewing error logs in Cloud Logging] (
      # https://cloud.google.com/healthcare/docs/how-tos/logging) and [
      # QueryAccessibleData] for a sample log entry).
      class QueryAccessibleDataRequest
        include Google::Apis::Core::Hashable
      
        # The Cloud Storage location for export.
        # Corresponds to the JSON property `gcsDestination`
        # @return [Google::Apis::HealthcareV1::GoogleCloudHealthcareV1ConsentGcsDestination]
        attr_accessor :gcs_destination
      
        # The values of request attributes associated with this access request.
        # Corresponds to the JSON property `requestAttributes`
        # @return [Hash<String,String>]
        attr_accessor :request_attributes
      
        # Optional. The values of resource attributes associated with the type of
        # resources being requested. If no values are specified, then all resource types
        # are included in the output.
        # Corresponds to the JSON property `resourceAttributes`
        # @return [Hash<String,String>]
        attr_accessor :resource_attributes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gcs_destination = args[:gcs_destination] if args.key?(:gcs_destination)
          @request_attributes = args[:request_attributes] if args.key?(:request_attributes)
          @resource_attributes = args[:resource_attributes] if args.key?(:resource_attributes)
        end
      end
      
      # Response for successful QueryAccessibleData operations. This structure is
      # included in the response upon operation completion.
      class QueryAccessibleDataResponse
        include Google::Apis::Core::Hashable
      
        # List of files, each of which contains a list of data_id(s) that are consented
        # for a specified use in the request.
        # Corresponds to the JSON property `gcsUris`
        # @return [Array<String>]
        attr_accessor :gcs_uris
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gcs_uris = args[:gcs_uris] if args.key?(:gcs_uris)
        end
      end
      
      # Define how to redact sensitive values. Default behaviour is erase. For example,
      # "My name is Jane." becomes "My name is ."
      class RedactConfig
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Rejects the latest revision of the specified Consent by committing a new
      # revision with `state` updated to `REJECTED`. If the latest revision of the
      # given Consent is in the `REJECTED` state, no new revision is committed.
      class RejectConsentRequest
        include Google::Apis::Core::Hashable
      
        # Optional. The resource name of the Consent artifact that contains
        # documentation of the user's rejection of the draft Consent, of the form `
        # projects/`project_id`/locations/`location_id`/datasets/`dataset_id`/
        # consentStores/`consent_store_id`/consentArtifacts/`consent_artifact_id``. If
        # the draft Consent had a Consent artifact, this Consent artifact overwrites it.
        # Corresponds to the JSON property `consentArtifact`
        # @return [String]
        attr_accessor :consent_artifact
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consent_artifact = args[:consent_artifact] if args.key?(:consent_artifact)
        end
      end
      
      # When using the INSPECT_AND_TRANSFORM action, each match is replaced with the
      # name of the info_type. For example, "My name is Jane" becomes "My name is [
      # PERSON_NAME]." The TRANSFORM action is equivalent to redacting.
      class ReplaceWithInfoTypeConfig
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # A list of FHIR resources.
      class Resources
        include Google::Apis::Core::Hashable
      
        # List of resources IDs. For example, "Patient/1234".
        # Corresponds to the JSON property `resources`
        # @return [Array<String>]
        attr_accessor :resources
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @resources = args[:resources] if args.key?(:resources)
        end
      end
      
      # The consent evaluation result for a single `data_id`.
      class Result
        include Google::Apis::Core::Hashable
      
        # The resource names of all evaluated Consents mapped to their evaluation.
        # Corresponds to the JSON property `consentDetails`
        # @return [Hash<String,Google::Apis::HealthcareV1::ConsentEvaluation>]
        attr_accessor :consent_details
      
        # Whether the resource is consented for the given use.
        # Corresponds to the JSON property `consented`
        # @return [Boolean]
        attr_accessor :consented
        alias_method :consented?, :consented
      
        # The unique identifier of the evaluated resource.
        # Corresponds to the JSON property `dataId`
        # @return [String]
        attr_accessor :data_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consent_details = args[:consent_details] if args.key?(:consent_details)
          @consented = args[:consented] if args.key?(:consented)
          @data_id = args[:data_id] if args.key?(:data_id)
        end
      end
      
      # Revokes the latest revision of the specified Consent by committing a new
      # revision with `state` updated to `REVOKED`. If the latest revision of the
      # given Consent is in the `REVOKED` state, no new revision is committed.
      class RevokeConsentRequest
        include Google::Apis::Core::Hashable
      
        # Optional. The resource name of the Consent artifact that contains proof of the
        # user's revocation of the Consent, of the form `projects/`project_id`/locations/
        # `location_id`/datasets/`dataset_id`/consentStores/`consent_store_id`/
        # consentArtifacts/`consent_artifact_id``.
        # Corresponds to the JSON property `consentArtifact`
        # @return [String]
        attr_accessor :consent_artifact
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @consent_artifact = args[:consent_artifact] if args.key?(:consent_artifact)
        end
      end
      
      # Configuration for the FHIR BigQuery schema. Determines how the server
      # generates the schema.
      class SchemaConfig
        include Google::Apis::Core::Hashable
      
        # Configuration for FHIR BigQuery time-partitioned tables.
        # Corresponds to the JSON property `lastUpdatedPartitionConfig`
        # @return [Google::Apis::HealthcareV1::TimePartitioning]
        attr_accessor :last_updated_partition_config
      
        # The depth for all recursive structures in the output analytics schema. For
        # example, `concept` in the CodeSystem resource is a recursive structure; when
        # the depth is 2, the CodeSystem table will have a column called `concept.
        # concept` but not `concept.concept.concept`. If not specified or set to 0, the
        # server will use the default value 2. The maximum depth allowed is 5.
        # Corresponds to the JSON property `recursiveStructureDepth`
        # @return [Fixnum]
        attr_accessor :recursive_structure_depth
      
        # Specifies the output schema type. Schema type is required.
        # Corresponds to the JSON property `schemaType`
        # @return [String]
        attr_accessor :schema_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @last_updated_partition_config = args[:last_updated_partition_config] if args.key?(:last_updated_partition_config)
          @recursive_structure_depth = args[:recursive_structure_depth] if args.key?(:recursive_structure_depth)
          @schema_type = args[:schema_type] if args.key?(:schema_type)
        end
      end
      
      # An HL7v2 logical group construct.
      class SchemaGroup
        include Google::Apis::Core::Hashable
      
        # True indicates that this is a choice group, meaning that only one of its
        # segments can exist in a given message.
        # Corresponds to the JSON property `choice`
        # @return [Boolean]
        attr_accessor :choice
        alias_method :choice?, :choice
      
        # The maximum number of times this group can be repeated. 0 or -1 means
        # unbounded.
        # Corresponds to the JSON property `maxOccurs`
        # @return [Fixnum]
        attr_accessor :max_occurs
      
        # Nested groups and/or segments.
        # Corresponds to the JSON property `members`
        # @return [Array<Google::Apis::HealthcareV1::GroupOrSegment>]
        attr_accessor :members
      
        # The minimum number of times this group must be present/repeated.
        # Corresponds to the JSON property `minOccurs`
        # @return [Fixnum]
        attr_accessor :min_occurs
      
        # The name of this group. For example, "ORDER_DETAIL".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @choice = args[:choice] if args.key?(:choice)
          @max_occurs = args[:max_occurs] if args.key?(:max_occurs)
          @members = args[:members] if args.key?(:members)
          @min_occurs = args[:min_occurs] if args.key?(:min_occurs)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # A schema package contains a set of schemas and type definitions.
      class SchemaPackage
        include Google::Apis::Core::Hashable
      
        # Flag to ignore all min_occurs restrictions in the schema. This means that
        # incoming messages can omit any group, segment, field, component, or
        # subcomponent.
        # Corresponds to the JSON property `ignoreMinOccurs`
        # @return [Boolean]
        attr_accessor :ignore_min_occurs
        alias_method :ignore_min_occurs?, :ignore_min_occurs
      
        # Schema configs that are layered based on their VersionSources that match the
        # incoming message. Schema configs present in higher indices override those in
        # lower indices with the same message type and trigger event if their
        # VersionSources all match an incoming message.
        # Corresponds to the JSON property `schemas`
        # @return [Array<Google::Apis::HealthcareV1::Hl7SchemaConfig>]
        attr_accessor :schemas
      
        # Determines how messages that fail to parse are handled.
        # Corresponds to the JSON property `schematizedParsingType`
        # @return [String]
        attr_accessor :schematized_parsing_type
      
        # Schema type definitions that are layered based on their VersionSources that
        # match the incoming message. Type definitions present in higher indices
        # override those in lower indices with the same type name if their
        # VersionSources all match an incoming message.
        # Corresponds to the JSON property `types`
        # @return [Array<Google::Apis::HealthcareV1::Hl7TypesConfig>]
        attr_accessor :types
      
        # Determines how unexpected segments (segments not matched to the schema) are
        # handled.
        # Corresponds to the JSON property `unexpectedSegmentHandling`
        # @return [String]
        attr_accessor :unexpected_segment_handling
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ignore_min_occurs = args[:ignore_min_occurs] if args.key?(:ignore_min_occurs)
          @schemas = args[:schemas] if args.key?(:schemas)
          @schematized_parsing_type = args[:schematized_parsing_type] if args.key?(:schematized_parsing_type)
          @types = args[:types] if args.key?(:types)
          @unexpected_segment_handling = args[:unexpected_segment_handling] if args.key?(:unexpected_segment_handling)
        end
      end
      
      # An HL7v2 Segment.
      class SchemaSegment
        include Google::Apis::Core::Hashable
      
        # The maximum number of times this segment can be present in this group. 0 or -1
        # means unbounded.
        # Corresponds to the JSON property `maxOccurs`
        # @return [Fixnum]
        attr_accessor :max_occurs
      
        # The minimum number of times this segment can be present in this group.
        # Corresponds to the JSON property `minOccurs`
        # @return [Fixnum]
        attr_accessor :min_occurs
      
        # The Segment type. For example, "PID".
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_occurs = args[:max_occurs] if args.key?(:max_occurs)
          @min_occurs = args[:min_occurs] if args.key?(:min_occurs)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # The content of an HL7v2 message in a structured format as specified by a
      # schema.
      class SchematizedData
        include Google::Apis::Core::Hashable
      
        # JSON output of the parser.
        # Corresponds to the JSON property `data`
        # @return [String]
        attr_accessor :data
      
        # The error output of the parser.
        # Corresponds to the JSON property `error`
        # @return [String]
        attr_accessor :error
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data = args[:data] if args.key?(:data)
          @error = args[:error] if args.key?(:error)
        end
      end
      
      # Request to search the resources in the specified FHIR store.
      class SearchResourcesRequest
        include Google::Apis::Core::Hashable
      
        # The FHIR resource type to search, such as Patient or Observation. For a
        # complete list, see the FHIR Resource Index ([DSTU2](http://hl7.org/implement/
        # standards/fhir/DSTU2/resourcelist.html), [STU3](http://hl7.org/implement/
        # standards/fhir/STU3/resourcelist.html), [R4](http://hl7.org/implement/
        # standards/fhir/R4/resourcelist.html)).
        # Corresponds to the JSON property `resourceType`
        # @return [String]
        attr_accessor :resource_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @resource_type = args[:resource_type] if args.key?(:resource_type)
        end
      end
      
      # A segment in a structured format.
      class Segment
        include Google::Apis::Core::Hashable
      
        # A mapping from the positional location to the value. The key string uses zero-
        # based indexes separated by dots to identify Fields, components and sub-
        # components. A bracket notation is also used to identify different instances of
        # a repeated field. Regex for key: (\d+)(\[\d+\])?(.\d+)?(.\d+)? Examples of (
        # key, value) pairs: * (0.1, "hemoglobin") denotes that the first component of
        # Field 0 has the value "hemoglobin". * (1.1.2, "CBC") denotes that the second
        # sub-component of the first component of Field 1 has the value "CBC". * (1[0].1,
        # "HbA1c") denotes that the first component of the first Instance of Field 1,
        # which is repeated, has the value "HbA1c".
        # Corresponds to the JSON property `fields`
        # @return [Hash<String,String>]
        attr_accessor :fields
      
        # A string that indicates the type of segment. For example, EVN or PID.
        # Corresponds to the JSON property `segmentId`
        # @return [String]
        attr_accessor :segment_id
      
        # Set ID for segments that can be in a set. This can be empty if it's missing or
        # isn't applicable.
        # Corresponds to the JSON property `setId`
        # @return [String]
        attr_accessor :set_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fields = args[:fields] if args.key?(:fields)
          @segment_id = args[:segment_id] if args.key?(:segment_id)
          @set_id = args[:set_id] if args.key?(:set_id)
        end
      end
      
      # Request message for `SetIamPolicy` method.
      class SetIamPolicyRequest
        include Google::Apis::Core::Hashable
      
        # An Identity and Access Management (IAM) policy, which specifies access
        # controls for Google Cloud resources. A `Policy` is a collection of `bindings`.
        # A `binding` binds one or more `members`, or principals, to a single `role`.
        # Principals can be user accounts, service accounts, Google groups, and domains (
        # such as G Suite). A `role` is a named list of permissions; each `role` can be
        # an IAM predefined role or a user-created custom role. For some types of Google
        # Cloud resources, a `binding` can also specify a `condition`, which is a
        # logical expression that allows access to a resource only if the expression
        # evaluates to `true`. A condition can add constraints based on attributes of
        # the request, the resource, or both. To learn which resources support
        # conditions in their IAM policies, see the [IAM documentation](https://cloud.
        # google.com/iam/help/conditions/resource-policies). **JSON example:** ``` ` "
        # bindings": [ ` "role": "roles/resourcemanager.organizationAdmin", "members": [
        # "user:mike@example.com", "group:admins@example.com", "domain:google.com", "
        # serviceAccount:my-project-id@appspot.gserviceaccount.com" ] `, ` "role": "
        # roles/resourcemanager.organizationViewer", "members": [ "user:eve@example.com"
        # ], "condition": ` "title": "expirable access", "description": "Does not grant
        # access after Sep 2020", "expression": "request.time < timestamp('2020-10-01T00:
        # 00:00.000Z')", ` ` ], "etag": "BwWWja0YfJA=", "version": 3 ` ``` **YAML
        # example:** ``` bindings: - members: - user:mike@example.com - group:admins@
        # example.com - domain:google.com - serviceAccount:my-project-id@appspot.
        # gserviceaccount.com role: roles/resourcemanager.organizationAdmin - members: -
        # user:eve@example.com role: roles/resourcemanager.organizationViewer condition:
        # title: expirable access description: Does not grant access after Sep 2020
        # expression: request.time < timestamp('2020-10-01T00:00:00.000Z') etag:
        # BwWWja0YfJA= version: 3 ``` For a description of IAM and its features, see the
        # [IAM documentation](https://cloud.google.com/iam/docs/).
        # Corresponds to the JSON property `policy`
        # @return [Google::Apis::HealthcareV1::Policy]
        attr_accessor :policy
      
        # OPTIONAL: A FieldMask specifying which fields of the policy to modify. Only
        # the fields in the mask will be modified. If no mask is provided, the following
        # default mask is used: `paths: "bindings, etag"`
        # Corresponds to the JSON property `updateMask`
        # @return [String]
        attr_accessor :update_mask
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @policy = args[:policy] if args.key?(:policy)
          @update_mask = args[:update_mask] if args.key?(:update_mask)
        end
      end
      
      # User signature.
      class Signature
        include Google::Apis::Core::Hashable
      
        # Raw bytes representing consent artifact content.
        # Corresponds to the JSON property `image`
        # @return [Google::Apis::HealthcareV1::Image]
        attr_accessor :image
      
        # Optional. Metadata associated with the user's signature. For example, the user'
        # s name or the user's title.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,String>]
        attr_accessor :metadata
      
        # Optional. Timestamp of the signature.
        # Corresponds to the JSON property `signatureTime`
        # @return [String]
        attr_accessor :signature_time
      
        # Required. User's UUID provided by the client.
        # Corresponds to the JSON property `userId`
        # @return [String]
        attr_accessor :user_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @image = args[:image] if args.key?(:image)
          @metadata = args[:metadata] if args.key?(:metadata)
          @signature_time = args[:signature_time] if args.key?(:signature_time)
          @user_id = args[:user_id] if args.key?(:user_id)
        end
      end
      
      # The `Status` type defines a logical error model that is suitable for different
      # programming environments, including REST APIs and RPC APIs. It is used by [
      # gRPC](https://github.com/grpc). Each `Status` message contains three pieces of
      # data: error code, error message, and error details. You can find out more
      # about this error model and how to work with it in the [API Design Guide](https:
      # //cloud.google.com/apis/design/errors).
      class Status
        include Google::Apis::Core::Hashable
      
        # The status code, which should be an enum value of google.rpc.Code.
        # Corresponds to the JSON property `code`
        # @return [Fixnum]
        attr_accessor :code
      
        # A list of messages that carry the error details. There is a common set of
        # message types for APIs to use.
        # Corresponds to the JSON property `details`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :details
      
        # A developer-facing error message, which should be in English. Any user-facing
        # error message should be localized and sent in the google.rpc.Status.details
        # field, or localized by the client.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @details = args[:details] if args.key?(:details)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # Contains configuration for streaming FHIR export.
      class StreamConfig
        include Google::Apis::Core::Hashable
      
        # The configuration for exporting to BigQuery.
        # Corresponds to the JSON property `bigqueryDestination`
        # @return [Google::Apis::HealthcareV1::GoogleCloudHealthcareV1FhirBigQueryDestination]
        attr_accessor :bigquery_destination
      
        # Contains configuration for streaming de-identified FHIR export.
        # Corresponds to the JSON property `deidentifiedStoreDestination`
        # @return [Google::Apis::HealthcareV1::DeidentifiedStoreDestination]
        attr_accessor :deidentified_store_destination
      
        # Supply a FHIR resource type (such as "Patient" or "Observation"). See https://
        # www.hl7.org/fhir/valueset-resource-types.html for a list of all FHIR resource
        # types. The server treats an empty list as an intent to stream all the
        # supported resource types in this FHIR store.
        # Corresponds to the JSON property `resourceTypes`
        # @return [Array<String>]
        attr_accessor :resource_types
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bigquery_destination = args[:bigquery_destination] if args.key?(:bigquery_destination)
          @deidentified_store_destination = args[:deidentified_store_destination] if args.key?(:deidentified_store_destination)
          @resource_types = args[:resource_types] if args.key?(:resource_types)
        end
      end
      
      # List of tags to be filtered.
      class TagFilterList
        include Google::Apis::Core::Hashable
      
        # Tags to be filtered. Tags must be DICOM Data Elements, File Meta Elements, or
        # Directory Structuring Elements, as defined at: http://dicom.nema.org/medical/
        # dicom/current/output/html/part06.html#table_6-1,. They may be provided by "
        # Keyword" or "Tag". For example "PatientID", "00100010".
        # Corresponds to the JSON property `tags`
        # @return [Array<String>]
        attr_accessor :tags
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @tags = args[:tags] if args.key?(:tags)
        end
      end
      
      # Request message for `TestIamPermissions` method.
      class TestIamPermissionsRequest
        include Google::Apis::Core::Hashable
      
        # The set of permissions to check for the `resource`. Permissions with wildcards
        # (such as `*` or `storage.*`) are not allowed. For more information see [IAM
        # Overview](https://cloud.google.com/iam/docs/overview#permissions).
        # Corresponds to the JSON property `permissions`
        # @return [Array<String>]
        attr_accessor :permissions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @permissions = args[:permissions] if args.key?(:permissions)
        end
      end
      
      # Response message for `TestIamPermissions` method.
      class TestIamPermissionsResponse
        include Google::Apis::Core::Hashable
      
        # A subset of `TestPermissionsRequest.permissions` that the caller is allowed.
        # Corresponds to the JSON property `permissions`
        # @return [Array<String>]
        attr_accessor :permissions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @permissions = args[:permissions] if args.key?(:permissions)
        end
      end
      
      # 
      class TextConfig
        include Google::Apis::Core::Hashable
      
        # Transformations to apply to the detected data, overridden by `
        # exclude_info_types`.
        # Corresponds to the JSON property `additionalTransformations`
        # @return [Array<Google::Apis::HealthcareV1::InfoTypeTransformation>]
        attr_accessor :additional_transformations
      
        # InfoTypes to skip transforming, overriding `additional_transformations`.
        # Corresponds to the JSON property `excludeInfoTypes`
        # @return [Array<String>]
        attr_accessor :exclude_info_types
      
        # The transformations to apply to the detected data. Deprecated. Use `
        # additional_transformations` instead.
        # Corresponds to the JSON property `transformations`
        # @return [Array<Google::Apis::HealthcareV1::InfoTypeTransformation>]
        attr_accessor :transformations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @additional_transformations = args[:additional_transformations] if args.key?(:additional_transformations)
          @exclude_info_types = args[:exclude_info_types] if args.key?(:exclude_info_types)
          @transformations = args[:transformations] if args.key?(:transformations)
        end
      end
      
      # A span of text in the provided document.
      class TextSpan
        include Google::Apis::Core::Hashable
      
        # The unicode codepoint index of the beginning of this span.
        # Corresponds to the JSON property `beginOffset`
        # @return [Fixnum]
        attr_accessor :begin_offset
      
        # The original text contained in this span.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @begin_offset = args[:begin_offset] if args.key?(:begin_offset)
          @content = args[:content] if args.key?(:content)
        end
      end
      
      # Configuration for FHIR BigQuery time-partitioned tables.
      class TimePartitioning
        include Google::Apis::Core::Hashable
      
        # Number of milliseconds for which to keep the storage for a partition.
        # Corresponds to the JSON property `expirationMs`
        # @return [Fixnum]
        attr_accessor :expiration_ms
      
        # Type of partitioning.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @expiration_ms = args[:expiration_ms] if args.key?(:expiration_ms)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # A type definition for some HL7v2 type (incl. Segments and Datatypes).
      class Type
        include Google::Apis::Core::Hashable
      
        # The (sub) fields this type has (if not primitive).
        # Corresponds to the JSON property `fields`
        # @return [Array<Google::Apis::HealthcareV1::Field>]
        attr_accessor :fields
      
        # The name of this type. This would be the segment or datatype name. For example,
        # "PID" or "XPN".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # If this is a primitive type then this field is the type of the primitive For
        # example, STRING. Leave unspecified for composite types.
        # Corresponds to the JSON property `primitive`
        # @return [String]
        attr_accessor :primitive
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fields = args[:fields] if args.key?(:fields)
          @name = args[:name] if args.key?(:name)
          @primitive = args[:primitive] if args.key?(:primitive)
        end
      end
      
      # Maps a resource to the associated user and Attributes.
      class UserDataMapping
        include Google::Apis::Core::Hashable
      
        # Output only. Indicates the time when this mapping was archived.
        # Corresponds to the JSON property `archiveTime`
        # @return [String]
        attr_accessor :archive_time
      
        # Output only. Indicates whether this mapping is archived.
        # Corresponds to the JSON property `archived`
        # @return [Boolean]
        attr_accessor :archived
        alias_method :archived?, :archived
      
        # Required. A unique identifier for the mapped resource.
        # Corresponds to the JSON property `dataId`
        # @return [String]
        attr_accessor :data_id
      
        # Resource name of the User data mapping, of the form `projects/`project_id`/
        # locations/`location_id`/datasets/`dataset_id`/consentStores/`consent_store_id`/
        # userDataMappings/`user_data_mapping_id``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Attributes of the resource. Only explicitly set attributes are displayed here.
        # Attribute definitions with defaults set implicitly apply to these User data
        # mappings. Attributes listed here must be single valued, that is, exactly one
        # value is specified for the field "values" in each Attribute.
        # Corresponds to the JSON property `resourceAttributes`
        # @return [Array<Google::Apis::HealthcareV1::Attribute>]
        attr_accessor :resource_attributes
      
        # Required. User's UUID provided by the client.
        # Corresponds to the JSON property `userId`
        # @return [String]
        attr_accessor :user_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @archive_time = args[:archive_time] if args.key?(:archive_time)
          @archived = args[:archived] if args.key?(:archived)
          @data_id = args[:data_id] if args.key?(:data_id)
          @name = args[:name] if args.key?(:name)
          @resource_attributes = args[:resource_attributes] if args.key?(:resource_attributes)
          @user_id = args[:user_id] if args.key?(:user_id)
        end
      end
      
      # Contains the configuration for FHIR profiles and validation.
      class ValidationConfig
        include Google::Apis::Core::Hashable
      
        # Whether to disable FHIRPath validation for incoming resources. Set this to
        # true to disable checking incoming resources for conformance against FHIRPath
        # requirement defined in the FHIR specification. This property only affects
        # resource types that do not have profiles configured for them, any rules in
        # enabled implementation guides will still be enforced.
        # Corresponds to the JSON property `disableFhirpathValidation`
        # @return [Boolean]
        attr_accessor :disable_fhirpath_validation
        alias_method :disable_fhirpath_validation?, :disable_fhirpath_validation
      
        # Whether to disable profile validation for this FHIR store. Set this to true to
        # disable checking incoming resources for conformance against structure
        # definitions in this FHIR store.
        # Corresponds to the JSON property `disableProfileValidation`
        # @return [Boolean]
        attr_accessor :disable_profile_validation
        alias_method :disable_profile_validation?, :disable_profile_validation
      
        # Whether to disable reference type validation for incoming resources. Set this
        # to true to disable checking incoming resources for conformance against
        # reference type requirement defined in the FHIR specification. This property
        # only affects resource types that do not have profiles configured for them, any
        # rules in enabled implementation guides will still be enforced.
        # Corresponds to the JSON property `disableReferenceTypeValidation`
        # @return [Boolean]
        attr_accessor :disable_reference_type_validation
        alias_method :disable_reference_type_validation?, :disable_reference_type_validation
      
        # Whether to disable required fields validation for incoming resources. Set this
        # to true to disable checking incoming resources for conformance against
        # required fields requirement defined in the FHIR specification. This property
        # only affects resource types that do not have profiles configured for them, any
        # rules in enabled implementation guides will still be enforced.
        # Corresponds to the JSON property `disableRequiredFieldValidation`
        # @return [Boolean]
        attr_accessor :disable_required_field_validation
        alias_method :disable_required_field_validation?, :disable_required_field_validation
      
        # A list of implementation guide URLs in this FHIR store that are used to
        # configure the profiles to use for validation. For example, to use the US Core
        # profiles for validation, set `enabled_implementation_guides` to `["http://hl7.
        # org/fhir/us/core/ImplementationGuide/ig"]`. If `enabled_implementation_guides`
        # is empty or omitted, then incoming resources are only required to conform to
        # the base FHIR profiles. Otherwise, a resource must conform to at least one
        # profile listed in the `global` property of one of the enabled
        # ImplementationGuides. The Cloud Healthcare API does not currently enforce all
        # of the rules in a StructureDefinition. The following rules are supported: -
        # min/max - minValue/maxValue - maxLength - type - fixed[x] - pattern[x] on
        # simple types - slicing, when using "value" as the discriminator type When a
        # URL cannot be resolved (for example, in a type assertion), the server does not
        # return an error.
        # Corresponds to the JSON property `enabledImplementationGuides`
        # @return [Array<String>]
        attr_accessor :enabled_implementation_guides
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @disable_fhirpath_validation = args[:disable_fhirpath_validation] if args.key?(:disable_fhirpath_validation)
          @disable_profile_validation = args[:disable_profile_validation] if args.key?(:disable_profile_validation)
          @disable_reference_type_validation = args[:disable_reference_type_validation] if args.key?(:disable_reference_type_validation)
          @disable_required_field_validation = args[:disable_required_field_validation] if args.key?(:disable_required_field_validation)
          @enabled_implementation_guides = args[:enabled_implementation_guides] if args.key?(:enabled_implementation_guides)
        end
      end
      
      # Describes a selector for extracting and matching an MSH field to a value.
      class VersionSource
        include Google::Apis::Core::Hashable
      
        # The field to extract from the MSH segment. For example, "3.1" or "18[1].1".
        # Corresponds to the JSON property `mshField`
        # @return [String]
        attr_accessor :msh_field
      
        # The value to match with the field. For example, "My Application Name" or "2.3".
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @msh_field = args[:msh_field] if args.key?(:msh_field)
          @value = args[:value] if args.key?(:value)
        end
      end
    end
  end
end
