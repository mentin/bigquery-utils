/*
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

-- to_binary:
-- Input: INT64 number
-- Output: STRING representing the input number in binary form
CREATE OR REPLACE FUNCTION fn.to_binary(x INT64) AS 
(
  (
    SELECT 
      STRING_AGG(CAST(x >> bit & 0x1 AS STRING), '' ORDER BY bit DESC)
    FROM 
      UNNEST(GENERATE_ARRAY(0, 63)) AS bit
  )
);
