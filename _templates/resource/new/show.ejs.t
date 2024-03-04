---
to: app/<%= h.inflection.pluralize(h.changeCase.kebab(name)) %>/[id]/page.tsx
---
import { notFound } from "next/navigation";
import * as <%= h.inflection.pluralize(h.changeCase.camel(name)) %> from '~/db/schema/<%= h.inflection.pluralize(h.changeCase.kebab(name)) %>/actions'

type <%= h.inflection.pluralize(h.changeCase.pascal(name)) %>ShowPageProps = {
    params: {
        id: string;
    };
    searchParams: {};
}

async function <%= h.inflection.pluralize(h.changeCase.pascal(name)) %>ShowPage({ params }: <%= h.inflection.pluralize(h.changeCase.pascal(name)) %>ShowPageProps) {
    const <%= h.inflection.singularize(h.changeCase.camel(name)) %> = await <%= h.inflection.pluralize(h.changeCase.camel(name)) %>.show(params.id)

    if (!<%= h.inflection.singularize(h.changeCase.camel(name)) %>) {
        notFound()
    }

    return (
        <div>
            <h1>{<%= h.inflection.singularize(h.changeCase.camel(name)) %>.id}</h1>
        </div>
    )
}

export default <%= h.inflection.pluralize(h.changeCase.pascal(name)) %>ShowPage