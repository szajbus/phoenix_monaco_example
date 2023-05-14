import * as monaco from "monaco-editor";

const CodeEditor = {
  mounted() {
    self.MonacoEnvironment = {
      globalAPI: true,
      getWorkerUrl(_workerId, label) {
        switch (label) {
          case "css":
          case "less":
          case "scss":
            return "/assets/monaco-editor/language/css/css.worker.js";
          case "html":
          case "handlebars":
          case "razor":
            return "/assets/monaco-editor/language/html/html.worker.js";
          case "json":
            return "/assets/monaco-editor/language/json/json.worker.js";
          case "javascript":
          case "typescript":
            return "/assets/monaco-editor/language/typescript/ts.worker.js";
          default:
            return "/assets/monaco-editor/editor/editor.worker.js";
        }
      },
    };

    const container = this.el.querySelector("[data-el-code-editor]");
    const { language, code } = this.el.dataset;

    this.editor = monaco.editor.create(container, {
      theme: "vs-dark",
      language: language,
      value: code,
      minimap: {
        enabled: false,
      },
      // ... other options
    });
  },

  destroyed() {
    if (this.editor) this.editor.dispose();
  },
};

export default CodeEditor;
