from __future__ import annotations

import re
from pathlib import Path
from xml.sax.saxutils import escape
from zipfile import ZipFile


SOURCE_EN = Path("/Users/a0/home/mpu/8121/work/何宁秋_Assignment1_Abstract.docx")
SOURCE_ZH = Path("/Users/a0/home/mpu/8121/work/何宁秋_Assignment1_Abstract_中文对照.docx")
OUTPUT_EN = Path("/Users/a0/home/mpu/8121/work/何宁秋_Assignment1_Abstract_四步结构版.docx")
OUTPUT_ZH = Path("/Users/a0/home/mpu/8121/work/何宁秋_Assignment1_Abstract_四步结构版_中文对照.docx")


ABSTRACT_EN = (
    "Sequential financial markets rely on observational learning to aggregate dispersed "
    "information from prior actions. However, early noisy actions can generate inefficient "
    "information cascades, and disclosure rules vary in their ability to filter these signals. "
    "Existing research has not established when delaying the use of public information improves "
    "collective decisions or whether the effect depends on the disclosure regime. We therefore evaluate "
    "dual-threshold gating across four disclosure regimes and test whether its effects persist "
    "when large language models (LLMs) introduce behavioral heterogeneity. In an agent-based "
    "model, 3,000 groups per treatment contain ten sequential agents who receive binary private "
    "signals with 0.60 accuracy. We compare pure action observation (PAO), optional disclosure "
    "(OD), selective disclosure (SD), and incentivized optional disclosure (IOD). One threshold "
    "delays weak public signals; the other gives silence directional meaning only after public "
    "evidence is strong. Without gating, mean accuracy over the last five decisions is 0.888 "
    "under SD and 0.856 under IOD, compared with 0.753 under PAO and 0.660 under OD. Gating "
    "raises accuracy to 0.798 under PAO and 0.697 under OD by limiting early reliance on noisy "
    "public histories. Effects differ when disclosure already screens information: accuracy "
    "increases to 0.910 under SD but falls to 0.843 under IOD, revealing the cost of delaying "
    "useful signals. These patterns remain stable across random seeds, and sensitivity tests "
    "identify effective ranges of 2-3 for the public-information threshold and 2-4 for the "
    "silence threshold. LLM augmentation increases behavioral variation without changing the "
    "broad advantage of screened or incentivized disclosure. Threshold gating is therefore a "
    "targeted corrective for weak information environments rather than a universal addition to "
    "disclosure rules. Effective design requires matching information-use thresholds to the "
    "screening capacity of the underlying disclosure regime."
)


ABSTRACT_ZH = (
    "顺序金融市场依靠观察性学习，从前序行为中汇聚分散信息。然而，早期噪声行为可能引发低效的信息级联，而不同披露规则"
    "筛选此类信息的能力并不相同。既有研究尚未明确，延迟使用公共信息在何种条件下能够改善群体决策，以及其作用是否取决于"
    "既有披露制度。因此，本文评估双阈值门控机制在四种披露制度下的效果，并检验在大语言模型（LLM）引入行为异质性后，这些"
    "效果是否仍然成立。研究采用基于智能体的模型，每种处理模拟3000个实验组；每组包含10名顺序决策的智能体，个体接收准确率"
    "为0.60的二元私人信号。模型比较仅观察行为（PAO）、可选披露（OD）、选择性披露（SD）和激励型可选披露（IOD）四种"
    "制度。一个阈值延迟弱公共信号的使用，另一个阈值仅在公共证据较强时赋予沉默行为方向性含义。未引入门控时，决策序列后5位"
    "的平均准确率在SD和IOD下分别为0.888和0.856，高于PAO的0.753和OD的0.660。阈值门控通过限制个体在早期对含噪公共历史"
    "的依赖，将PAO的准确率提高至0.798，将OD提高至0.697。当披露制度已能筛选信息时，门控效果存在差异：SD的准确率提高至"
    "0.910，而IOD下降至0.843，表明延迟有效信号会产生效率成本。上述结果在不同随机种子下保持稳定；敏感性检验显示，公共"
    "信息使用阈值的有效区间为2至3，沉默解释阈值为2至4。LLM增强仿真增加了行为差异，但未改变筛选型或激励型披露制度的总体"
    "优势。因此，阈值门控是针对信息质量较弱环境的纠偏工具，而非适用于所有披露制度的通用叠加规则。有效的制度设计应使信息"
    "使用阈值与既有披露制度的信息筛选能力相匹配。"
)


PARAGRAPH_RE = re.compile(r"<w:p(?:\s[^>]*)?>.*?</w:p>", re.DOTALL)
PPR_RE = re.compile(r"<w:pPr(?:\s[^>]*)?>.*?</w:pPr>", re.DOTALL)
RUN_RE = re.compile(r"<w:r(?:\s[^>]*)?>.*?</w:r>", re.DOTALL)
RPR_RE = re.compile(r"<w:rPr(?:\s[^>]*)?>.*?</w:rPr>", re.DOTALL)


def replace_abstract_paragraph(document_xml: bytes, new_text: str) -> bytes:
    xml = document_xml.decode("utf-8")
    paragraphs = list(PARAGRAPH_RE.finditer(xml))
    if len(paragraphs) < 4:
        raise ValueError("Expected at least four body paragraphs")

    match = paragraphs[2]
    old_paragraph = match.group(0)
    opening_tag = old_paragraph[: old_paragraph.index(">") + 1]
    ppr_match = PPR_RE.search(old_paragraph)
    ppr = ppr_match.group(0) if ppr_match else ""

    run_match = RUN_RE.search(old_paragraph)
    rpr = ""
    if run_match:
        rpr_match = RPR_RE.search(run_match.group(0))
        if rpr_match:
            rpr = rpr_match.group(0)

    new_paragraph = (
        f"{opening_tag}{ppr}<w:r>{rpr}<w:t>{escape(new_text)}</w:t></w:r></w:p>"
    )
    updated = xml[: match.start()] + new_paragraph + xml[match.end() :]
    return updated.encode("utf-8")


def create_revised_copy(source: Path, output: Path, new_text: str) -> None:
    output.parent.mkdir(parents=True, exist_ok=True)
    with ZipFile(source, "r") as source_zip, ZipFile(output, "w") as output_zip:
        for item in source_zip.infolist():
            data = source_zip.read(item.filename)
            if item.filename == "word/document.xml":
                data = replace_abstract_paragraph(data, new_text)
            output_zip.writestr(item, data)
    print(output)


def main() -> None:
    create_revised_copy(SOURCE_EN, OUTPUT_EN, ABSTRACT_EN)
    create_revised_copy(SOURCE_ZH, OUTPUT_ZH, ABSTRACT_ZH)
    print(f"English abstract word count: {len(ABSTRACT_EN.split())}")


if __name__ == "__main__":
    main()
