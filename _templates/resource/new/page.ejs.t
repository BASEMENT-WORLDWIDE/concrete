---
to: app/<%= h.inflection.pluralize(h.changeCase.kebab(name)) %>/page.tsx
---
import { db } from "~/db";
type <%= h.inflection.pluralize(h.changeCase.pascal(name)) %>PageProps = {
    params: {};
    searchParams: {};
}

async function <%= h.inflection.pluralize(h.changeCase.pascal(name)) %>Page({}: <%= h.inflection.pluralize(h.changeCase.pascal(name)) %>PageProps) {
    const <%= h.inflection.pluralize(h.changeCase.camel(name)) %> = await db.query.<%= h.inflection.pluralize(h.changeCase.camel(name)) %>.findMany();
    return (
        <div>
            <ul>
                {<%= h.inflection.pluralize(h.changeCase.camel(name)) %>.map(<%= h.inflection.singularize(h.changeCase.camel(name)) %> => (
                    <li key={<%= h.inflection.singularize(h.changeCase.camel(name)) %>.id}>{<%= h.inflection.singularize(h.changeCase.camel(name)) %>.id}</li>
                ))}
            </ul>
        </div>
    )
}

export default <%= h.inflection.pluralize(h.changeCase.pascal(name)) %>Page