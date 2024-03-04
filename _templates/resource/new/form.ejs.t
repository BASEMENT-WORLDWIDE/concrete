---
to: app/<%= h.inflection.pluralize(h.changeCase.kebab(name)) %>/components/form.tsx
---
'use client';

import { useForm, type SubmissionResult } from '@conform-to/react'
import { useFormState } from 'react-dom'
import { getZodConstraint, parseWithZod } from "@conform-to/zod";
import {
    insert<%= h.inflection.singularize(h.changeCase.pascal(name))%>Schema,
    Select<%= h.inflection.singularize(h.changeCase.pascal(name))%>Schema
} from '~/db/schema/<%= h.inflection.pluralize(h.changeCase.kebab(name)) %>'

type <%= h.changeCase.pascal(name)%>FormProps = {
  defaultValue?: Select<%= h.inflection.singularize(h.changeCase.pascal(name))%>Schema
  action: (
    prevState: unknown,
    formData: FormData
  ) => Promise<SubmissionResult<string[]> | null | undefined>;
}

function <%= h.changeCase.pascal(name) %>Form({ defaultValue, ...props }: <%= h.changeCase.pascal(name)%>FormProps) {
    const [lastResult, action] = useFormState(props.action, undefined)
    const [form, formFields] = useForm({
        lastResult,
        defaultValue,
        onValidate({ formData }) {
            return parseWithZod(formData, { schema: insert<%= h.inflection.singularize(h.changeCase.pascal(name))%>Schema })
        },
        constraint: getZodConstraint(insert<%= h.inflection.singularize(h.changeCase.pascal(name))%>Schema),
        shouldValidate: "onBlur",
        shouldRevalidate: "onInput"
    })
    return (
        <form id={form.id} action={action} onSubmit={form.onSubmit} noValidate className='space-y-6'>
        </form>
    )
}

export { <%= h.changeCase.pascal(name) %>Form }