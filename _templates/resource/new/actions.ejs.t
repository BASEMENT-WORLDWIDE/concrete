---
to: db/schema/<%= h.inflection.pluralize(h.changeCase.kebab(name)) %>/actions.tsx
---
'use server';

import { parseWithZod } from "@conform-to/zod";
import {
    insert<%= h.inflection.singularize(h.changeCase.pascal(name))%>Schema
} from '../<%= h.inflection.pluralize(h.changeCase.kebab(name)) %>'
import { redirect } from "next/navigation";
import { db } from '~/db'

async function show(id: string) {
    return db.query.<%= h.inflection.pluralize(h.changeCase.camel(name))%>.findFirst({ where: (<%= h.inflection.singularize(h.changeCase.camel(name))%>, ctx) => ctx.eq(<%= h.inflection.singularize(h.changeCase.camel(name))%>.id, id) })
}

async function create(prevState: unknown, formData: FormData) {
    const submission = parseWithZod(formData, { schema: insert<%= h.inflection.singularize(h.changeCase.pascal(name))%>Schema })

    if (submission.status !== 'success') {
        return submission.reply()
    }

    const {

    } = submission.value

    redirect('/')
}

async function update(prevState: unknown, formData: FormData) {
    const submission = parseWithZod(formData, { schema: insert<%= h.inflection.singularize(h.changeCase.pascal(name))%>Schema })

    if (submission.status !== 'success') {
        return submission.reply()
    }

    const {

    } = submission.value

    redirect('/')
}

export {
    create,
    update,
    show,
}