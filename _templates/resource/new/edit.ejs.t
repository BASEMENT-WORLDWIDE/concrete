---
to: app/<%= h.inflection.pluralize(h.changeCase.kebab(name)) %>/[id]/edit/page.tsx
---
import { notFound } from 'next/navigation'
import { <%= h.changeCase.pascal(name)%>Form } from '~/app/<%= h.inflection.pluralize(h.changeCase.kebab(name)) %>/components/form'
import * as <%= h.inflection.pluralize(h.changeCase.camel(name)) %> from '~/db/schema/<%= h.inflection.pluralize(h.changeCase.kebab(name)) %>/actions'


type <%= h.inflection.pluralize(h.changeCase.pascal(name)) %>EditPageProps = {
    params: {
        id: string;
    };
    searchParams: {};
}

async function <%= h.inflection.pluralize(h.changeCase.pascal(name)) %>EditPage({ params }: <%= h.inflection.pluralize(h.changeCase.pascal(name)) %>EditPageProps) {
    const <%= h.inflection.singularize(h.changeCase.camel(name)) %> = await <%= h.inflection.pluralize(h.changeCase.camel(name)) %>.show(params.id)

    if (!<%= h.inflection.singularize(h.changeCase.camel(name)) %>) {
        notFound()
    }

    return <<%= h.changeCase.pascal(name)%>Form defaultValue={<%= h.inflection.singularize(h.changeCase.camel(name)) %>} action={<%= h.inflection.pluralize(h.changeCase.camel(name)) %>.update} />
}

export default <%= h.inflection.pluralize(h.changeCase.pascal(name)) %>EditPage