---
to: db/schema.ts
inject: true
append: true
skip_if: <%= h.inflection.pluralize(h.changeCase.camel(name)) %>
---
export { <%= h.inflection.pluralize(h.changeCase.camel(name)) %> } from './<%= h.inflection.pluralize(h.changeCase.kebab(name)) %>'