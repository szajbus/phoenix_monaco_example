import * as monaco from "monaco-editor";

const CodeEditor = {
  mounted() {
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
