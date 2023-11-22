/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "policy_for" {
  description = "Resource hierarchy node to apply the policy to: can be one of `organization`, `folder`, or `project`."
  type        = string
}

variable "organization_id" {
  description = "The organization id for putting the policy"
  type        = string
  default     = null
}

variable "folder_id" {
  description = "The folder id for putting the policy"
  type        = string
  default     = null
}

variable "project_id" {
  description = "The project id for putting the policy"
  type        = string
  default     = null
}

variable "domains_to_allow" {
  description = "The list of domains to allow users from"
  type        = list(string)
}

variable "exclude_folders" {
  description = "Set of folders to exclude from the policy"
  type        = set(string)
  default     = []
}

variable "exclude_projects" {
  description = "Set of projects to exclude from the policy"
  type        = set(string)
  default     = []
}
