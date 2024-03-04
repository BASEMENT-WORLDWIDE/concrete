# Concrete — Opinionated Next.JS Boilerplate

## Get Started
`bun x create-next-app@latest --example https://github.com/BASEMENT-WORLDWIDE/concrete`

## What is Concrete?
Concrete was created as a boilerplate to improve my development velocity. If you are looking for a boilerplate with opinions, this may be your taste. I don't expect this to be used by anyone else, but in event that it is I hope that it saves you just as much time as it does myself.

## What opinions does Concrete have?
Opinions are largely around file convention and file generation. Following ideas found in popular frameworks such as Ruby on Rails and Laravel, Concrete strives to offset the burden of having to think which file goes where.

## File Structure
### App
<pre>
# this is pretty standard in most NextJS apps.
app/

# routes are generally created through using hygen.
app/[route]

# the page for the route
app/[route]/page.tsx

# components relevant to this specific route, such as `form`.
app/[route]/components/

# by default the id route is generated, however during development its expected that you will make the right decision that best fits your situation.
app/[route]/[id]/

# the page for the route
app/[route]/[id]/page.tsx

# the edit page for the resource. By default this will only contain a reference to the generic form component, and it will pre-fill the form with the specific resource.
app/[route]/[id]/edit/page.tsx

# the route for creating a resource
app/[route]/new/

# the page for the route similar to the edit page, by default this will contain a reference to the generic form component.
app/[route]/new/page.tsx
</pre>

### Database and Server Actions
I can foresee the decision to co-locate server actions next to the schema being contentious, for now thats where I've decided to put them. Considering server actions are the most likely to make use of database queries, it only makes sense in my mind to keep them close to the schema that they are relevant to.  
<pre>
# reference to drizzle database. this uses Turso by default.
db.ts

# generated file, updated when a resource is created through the cli.
db/schema.ts

# the generated resource file, with zod schemas and a table.
db/schema/[resource].ts

# this is effectively the "controller" that contains server actions and data-fetching functions.
db/schema/[resource]/actions.ts
</pre>

### Third-Party Libraries
<pre>
# this is where third-party libraries live.
vendors/
</pre>

### UI Libraries? TRPC? API Routes?
At the moment, I'll leave that to you to decide. In the future it may make sense to incoporate some of these ideas into Concrete, but for now this is where I'm at with it. I do love me some shadcn-ui.