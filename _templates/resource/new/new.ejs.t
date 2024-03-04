---
to: app/<%= h.inflection.pluralize(h.changeCase.kebab(name)) %>/new/page.tsx
---
import { <%= h.changeCase.pascal(name)%>Form } from '~/app/<%= h.inflection.pluralize(h.changeCase.kebab(name)) %>/components/form'
import * as <%= h.inflection.pluralize(h.changeCase.camel(name)) %> from '~/db/schema/<%= h.inflection.pluralize(h.changeCase.kebab(name)) %>/actions'

type <%= h.inflection.pluralize(h.changeCase.pascal(name)) %>NewPageProps = {
    params: {};
    searchParams: {};
}

async function <%= h.inflection.pluralize(h.changeCase.pascal(name)) %>NewPage({}: <%= h.inflection.pluralize(h.changeCase.pascal(name)) %>NewPageProps) {
    return <<%= h.changeCase.pascal(name)%>Form action={<%= h.inflection.pluralize(h.changeCase.camel(name)) %>.create} />
}

export default <%= h.inflection.pluralize(h.changeCase.pascal(name)) %>NewPage