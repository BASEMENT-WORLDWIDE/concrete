---
to: db/schema/<%= h.inflection.pluralize(h.changeCase.kebab(name)) %>.ts
---
import { z } from 'zod'
import { sqliteTable, text } from 'drizzle-orm/sqlite-core'
import { createInsertSchema, createSelectSchema } from 'drizzle-zod'

const <%= h.inflection.pluralize(h.changeCase.camel(name)) %> = sqliteTable('<%= h.inflection.pluralize(h.changeCase.snake(name)) %>', {
    id: text('id').primaryKey(),
})

const insert<%= h.inflection.singularize(h.changeCase.pascal(name))%>Schema = createInsertSchema(<%= h.inflection.pluralize(h.changeCase.camel(name)) %>)
const select<%= h.inflection.singularize(h.changeCase.pascal(name))%>Schema = createSelectSchema(<%= h.inflection.pluralize(h.changeCase.camel(name)) %>)

type Insert<%= h.inflection.singularize(h.changeCase.pascal(name))%>Schema = z.infer<typeof insert<%= h.inflection.singularize(h.changeCase.pascal(name))%>Schema>
type Select<%= h.inflection.singularize(h.changeCase.pascal(name))%>Schema = z.infer<typeof select<%= h.inflection.singularize(h.changeCase.pascal(name))%>Schema>

export type {
    Insert<%= h.inflection.singularize(h.changeCase.pascal(name))%>Schema,
    Select<%= h.inflection.singularize(h.changeCase.pascal(name))%>Schema
}

export {
    <%= h.inflection.pluralize(h.changeCase.camel(name)) %>,
    insert<%= h.inflection.singularize(h.changeCase.pascal(name))%>Schema,
    select<%= h.inflection.singularize(h.changeCase.pascal(name))%>Schema
}