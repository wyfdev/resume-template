import { renderFile as pugRender } from "pug";
import { parse as yaml_parse } from "yaml";

const yaml = await Deno.readTextFile("resume.yaml");
const data = await yaml_parse(yaml);

for (let lang in data) {
    const html = await pugRender("resume.pug", {resume: data[lang]}, { pretty: true })
    await Deno.writeTextFile(`dist/resume.${lang}.html`, html)
}

console.log("Dnne")