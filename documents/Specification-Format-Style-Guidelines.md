# Style Guidelines for document "specification" comments
- Wrapping is 80 characters for top-level messages.
- Wrap everything else to 80 characters or 100 depending
   - Prefer to wrap lines to 80 characters
   - It is OK to go over 80, but less than 100, if it makes the
     text clearer and easier to read.
     - This SHOULD be rare, however.
   - If you have links or tags, wrapping at 100 characters for clarity
     is acceptable.
   - We choose 80 characters here to work better in reviews because Github
     comment boxes are limited to roughly 80 characters width. The primary
     "code" interaction with proto files and markdown files is in review.
     Also, some markdown processors struggle with longer lines.
- Use blank lines (with `*` prefix) for paragraph breaks in message or
  enum declarations, regardless of where defined.
   - Use `<p>` tags for _fields_, and _no_ "empty" lines (it breaks the tables).
- Use HTML tags where appropriate, but stick to markdown as much as possible.
- Use correct US-English spelling and grammar to the maximum extent possible.
   - Write proper and complete sentences, avoid partial sentences and
     unnecessary abbreviations.
   - Do not use partial words (e.g. instead of "spec" write "specification").
   - Explain all acronyms on first use in a document.
      - Use "Hedera Consensus Service(HCS)" the first time "HCS" is written
        but "HCS" may be used thereafter.
      - Extremely common acronyms (e.g. RAM or LASER) do not need
        to be expanded.
- First line of each document block is "what is this", and should be a single
  sentence.  Examples: "An identifier for an account." or "A `tokenTransfer`
  transaction request body.".
   - Avoid "this is a thing" type sentences, write "A thing" instead.
      - This applies for the _first sentence_ only, **not** elsewhere.
        The first sentence is a "what is this" answer, not full description
        and mostly just translates from "code" syntax to plain English.
- Include a line break (`<br/>`) after the first line, then a brief description,
  if appropriate.
   - Not every field needs additional description, but _every_ `message` does.
   - Descriptions may be detailed, but should not include internal
     implementation details or requirements. The description _should_ be
     detailed enough to explain to an external contributor what the
     message or field contains, where it fits within the overall network
     system, and why it is needed.
      - This is a long-term goal; we have a long way to go to get to this
        level of description. Every PR to change `.proto` files should seek
        to improve the documentation for that file.
- After a paragraph break (a blank line for messages), one requirement per
  line. Use break tags at the end of each requirement except the last.
   - In field comments a `<p>` tag is _required_ for paragraph breaks.
     Blank lines break the automated documentation generator in **fields**
     because fields are output as markdown tables, and markdown tables require
     each row to be a single long line.
- Be _prescriptive_ in requirements.  Do not _describe_ the behavior.
   - Declare what MUST be done for valid inputs, and what SHALL be present in
     valid outputs (or in state messages).
   - Declare what SHALL happen as a result of a successful, or failed,
     transaction.
   - The word `will` usually means `SHALL` or `MUST`.
   - The word `is` often means `SHALL be`.
   - Document both positive (`SHALL` or `MUST`) and negative (`SHALL NOT` or
     `MUST NOT`) requirements.
   - Avoid "perfect" or "imperfect" verb aspects and "wiggle" words
     (might, could, perhaps, etc...).
      - The specification items MAY, SHOULD, and RECOMMENDED serve to fill
        the _occasional_ need for less imperative requirements.
   - Also avoid "progressive" verbs (e.g. working, writing, going, deleting).
- Requirements should be short and focused.
   - Better to have three separate lines for three items than one longer
     line with three clauses.
   - Duplicating text across lines with slightly different requirements
     is not only acceptable, but often recommended.
   - Well written specification tends to be much more short and clipped
     sentences than "normal" prose. Some describe the flow as "staccato".
- Add another blank line after requirements for `message` documents only.
- Each message that represents a transaction body **must** document the
  Block Stream effects with a heading `### Block Stream Effects`.
- General notes go last, for `message` only, with a heading
  `#### Additional Notes`.
