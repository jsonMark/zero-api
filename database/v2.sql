alter table results add topic_id int default 10010 not null;
insert into results(`group`, score, society, answer, tip,topic_id)
VALUES
    ('sas', 0, 0, '1,2,23,24','你没有明显的焦虑情绪。状态不错哦，继续保持！也许你时不时也会有一定的情绪波动，但就像天气变化一样，一定程度的情绪起伏、情绪波动是正常的。小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的成长：',10020),
    ('sas', 1, 0, '1,2,23,24','你没有明显的焦虑情绪。状态不错哦，继续保持！也许你时不时也会有一定的情绪波动，但就像天气变化一样，一定程度的情绪起伏、情绪波动是正常的。小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的成长：',10020),
    ('sas', 2, 0, '1,2,23,24','你没有明显的焦虑情绪。状态不错哦，继续保持！也许你时不时也会有一定的情绪波动，但就像天气变化一样，一定程度的情绪起伏、情绪波动是正常的。小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的成长：',10020),
    ('sas', 3, 0, '1,2,23,24','你没有明显的焦虑情绪。状态不错哦，继续保持！也许你时不时也会有一定的情绪波动，但就像天气变化一样，一定程度的情绪起伏、情绪波动是正常的。小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的成长：',10020),
    ('sas', 4, 0, '1,2,23,24','你没有明显的焦虑情绪。状态不错哦，继续保持！也许你时不时也会有一定的情绪波动，但就像天气变化一样，一定程度的情绪起伏、情绪波动是正常的。小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的成长：',10020),
    ('sas', 5, 0, '1,8,9','你的焦虑水平为轻度。生活无常，尤其近两年多，新冠病毒的肆虐几乎影响到我们所有人。你在生活中看来也有自己的一些焦虑情绪，希望小夏下面的一些建议能够帮助到你：',10020),
    ('sas', 6, 0, '10,6,11,12,9','你的焦虑水平为中度，希望小夏下面的一些建议能够帮助到你：',10020),
    ('sas', 7, 0, '10,6,29,9','你的焦虑水平为重度，希望小夏下面的一些建议能够帮助到你：',10020),
    ('sas', 8, 0, '10,6,29,9','你的焦虑水平为重度，希望小夏下面的一些建议能够帮助到你：',10020),
    ('sas', 9, 0, '10,6,29,9','你的焦虑水平为重度，希望小夏下面的一些建议能够帮助到你：',10020),
    ('sas', 10, 0, '10,6,29,9','你的焦虑水平为重度，希望小夏下面的一些建议能够帮助到你：',10020),


    ('isi', 0, 0, '25,26,27,16','你未达到具有临床意义的失眠水平。看来你的睡眠质量还不错哦，你未达到具有临床意义的失眠水平，继续保持！小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的生活质量及生命体验:',10030),
    ('isi', 1, 0, '25,26,27,16','你未达到具有临床意义的失眠水平。看来你的睡眠质量还不错哦，你未达到具有临床意义的失眠水平，继续保持！小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的生活质量及生命体验:',10030),
    ('isi', 2, 0, '25,26,27,16','你未达到具有临床意义的失眠水平。看来你的睡眠质量还不错哦，你未达到具有临床意义的失眠水平，继续保持！小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的生活质量及生命体验:',10030),
    ('isi', 3, 0, '25,26,27,16','你未达到具有临床意义的失眠水平。看来你的睡眠质量还不错哦，你未达到具有临床意义的失眠水平，继续保持！小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的生活质量及生命体验:',10030),
    ('isi', 4, 0, '25,26,27,16','你未达到具有临床意义的失眠水平。看来你的睡眠质量还不错哦，你未达到具有临床意义的失眠水平，继续保持！小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的生活质量及生命体验:',10030),
    ('isi', 5, 0, '25,26,27,16','你未达到具有临床意义的失眠水平。看来你的睡眠质量还不错哦，你未达到具有临床意义的失眠水平，继续保持！小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的生活质量及生命体验:',10030),
    ('isi', 6, 0, '25,26,27,16','你未达到具有临床意义的失眠水平。看来你的睡眠质量还不错哦，你未达到具有临床意义的失眠水平，继续保持！小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的生活质量及生命体验:',10030),
    ('isi', 7, 0, '25,26,27,16','你未达到具有临床意义的失眠水平。看来你的睡眠质量还不错哦，你未达到具有临床意义的失眠水平，继续保持！小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的生活质量及生命体验:',10030),
    ('isi', 8, 0, '14,29,15,16,17','你的失眠水平为轻度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 9, 0, '14,29,15,16,17','你的失眠水平为轻度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 10, 0, '14,29,15,16,17','你的失眠水平为轻度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 11, 0, '14,29,15,16,17','你的失眠水平为轻度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 12, 0, '14,29,15,16,17','你的失眠水平为轻度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 13, 0, '14,29,15,16,17','你的失眠水平为轻度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 14, 0, '14,29,15,16,17','你的失眠水平为轻度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 15, 0, '14,15,16,30,31','你的失眠水平为中度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 16, 0, '14,15,16,30,31','你的失眠水平为中度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 17, 0, '14,15,16,30,31','你的失眠水平为中度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 18, 0, '14,15,16,30,31','你的失眠水平为中度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 19, 0, '14,15,16,30,31','你的失眠水平为中度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 20, 0, '14,15,16,30,31','你的失眠水平为中度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 21, 0, '14,15,16,30,31','你的失眠水平为中度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在一定程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 22, 0, '30,31,14,15,16','你的失眠水平为重度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在很大程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 23, 0, '30,31,14,15,16','你的失眠水平为重度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在很大程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 24, 0, '30,31,14,15,16','你的失眠水平为重度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在很大程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 25, 0, '30,31,14,15,16','你的失眠水平为重度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在很大程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 26, 0, '30,31,14,15,16','你的失眠水平为重度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在很大程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 27, 0, '30,31,14,15,16','你的失眠水平为重度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在很大程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 28, 0, '30,31,14,15,16','你的失眠水平为重度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在很大程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 29, 0, '30,31,14,15,16','你的失眠水平为重度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在很大程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),
    ('isi', 30, 0, '30,31,14,15,16','你的失眠水平为重度。不知何时起，睡眠问题已经发展成为一个不容忽视的社会问题了，看来你在很大程度上也正面临着睡眠方面的困扰，希望小夏下面的一些建议能够帮到你：',10030),


    ('bdi', 0, 0, '1,2,23,24','你基本上没有抑郁症状。状态不错哦，继续保持！也许你时不时也会有一定的情绪波动，但就像天气变化一样，一定程度的情绪起伏、情绪波动是正常的。小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的成长：',10040),
    ('bdi', 1, 0, '1,2,23,24','你基本上没有抑郁症状。状态不错哦，继续保持！也许你时不时也会有一定的情绪波动，但就像天气变化一样，一定程度的情绪起伏、情绪波动是正常的。小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的成长：',10040),
    ('bdi', 2, 0, '1,2,23,24','你基本上没有抑郁症状。状态不错哦，继续保持！也许你时不时也会有一定的情绪波动，但就像天气变化一样，一定程度的情绪起伏、情绪波动是正常的。小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的成长：',10040),
    ('bdi', 3, 0, '1,2,23,24','你基本上没有抑郁症状。状态不错哦，继续保持！也许你时不时也会有一定的情绪波动，但就像天气变化一样，一定程度的情绪起伏、情绪波动是正常的。小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的成长：',10040),
    ('bdi', 4, 0, '1,2,23,24','你基本上没有抑郁症状。状态不错哦，继续保持！也许你时不时也会有一定的情绪波动，但就像天气变化一样，一定程度的情绪起伏、情绪波动是正常的。小夏这边给你提供几条发展性的建议，它们是为了让你获得更好的成长：',10040),
    ('bdi', 5, 0, '1,2,3,4','你的抑郁水平为轻度。很多人在人生的某些时刻都难免感到沮丧低落，尤其是身处现在这一瞬息万变的时代。希望小夏下面给您提供的一些小建议能够帮到你：',10040),
    ('bdi', 6, 0, '1,2,3,4','你的抑郁水平为轻度。很多人在人生的某些时刻都难免感到沮丧低落，尤其是身处现在这一瞬息万变的时代。希望小夏下面给您提供的一些小建议能够帮到你：',10040),
    ('bdi', 7, 0, '1,2,3,4','你的抑郁水平为轻度。很多人在人生的某些时刻都难免感到沮丧低落，尤其是身处现在这一瞬息万变的时代。希望小夏下面给您提供的一些小建议能够帮到你：',10040),
    ('bdi', 8, 0, '5,6,12,11','你的抑郁水平为中度。你最近可能感到沮丧，缺乏兴趣，关于如何能够改善你的情绪，小夏建议你：',10040),
    ('bdi', 9, 0, '5,6,12,11','你的抑郁水平为中度。你最近可能感到沮丧，缺乏兴趣，关于如何能够改善你的情绪，小夏建议你：',10040),
    ('bdi', 10, 0, '5,6,12,11','你的抑郁水平为中度。你最近可能感到沮丧，缺乏兴趣，关于如何能够改善你的情绪，小夏建议你：',10040),
    ('bdi', 11, 0, '5,6,12,11','你的抑郁水平为中度。你最近可能感到沮丧，缺乏兴趣，关于如何能够改善你的情绪，小夏建议你：',10040),
    ('bdi', 12, 0, '5,6,12,11','你的抑郁水平为中度。你最近可能感到沮丧，缺乏兴趣，关于如何能够改善你的情绪，小夏建议你：',10040),
    ('bdi', 13, 0, '5,6,12,11','你的抑郁水平为中度。你最近可能感到沮丧，缺乏兴趣，关于如何能够改善你的情绪，小夏建议你：',10040),
    ('bdi', 14, 0, '5,6,12,11','你的抑郁水平为中度。你最近可能感到沮丧，缺乏兴趣，关于如何能够改善你的情绪，小夏建议你：',10040),
    ('bdi', 15, 0, '5,6,12,11','你的抑郁水平为中度。你最近可能感到沮丧，缺乏兴趣，关于如何能够改善你的情绪，小夏建议你：',10040),
    ('bdi', 16, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 17, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 18, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 19, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 20, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 21, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 22, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 23, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 24, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 25, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 26, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 27, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 28, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 29, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 30, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 31, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 32, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 33, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040),
    ('bdi', 34, 0, '5,6,12,7,22','你的抑郁水平为重度。虽然不知道你经历了什么，但小夏知道你最近一定很难过，希望小夏的建议能够给现在的你提供一些帮助：',10040);

insert into suggests values (25, '你可以通过调整自己的行为，来进一步提升睡眠质量，规律锻炼，规律进餐，夜间避免过度饮用饮料，避免饮酒、吸烟，减少咖啡因的摄入。'),
                            (26, '良好的睡眠环境有助于我们保持良好的睡眠。确保你的卧室很舒适、夜间的温度适宜，且不受光线和声音的干扰。'),
                            (27, '良好的情绪有助于我们保持良好的睡眠。社会支持可以成为我们的铠甲。我们的家人、朋友、师长等，凡是愿意接纳、倾听我们的人，都属于我们的社会支持体系。多参加社会实践活动，平时多注意结交志同道合的好友，都有助于我们建立社会支持体系，能够有人分享我们的生命体验，接纳排解我们的不良情绪。'),
                            (29, '只有晚上有睡意或者到了规定的睡眠时间时，才上床休息；如果卧床后感觉到大约20分钟内无法入睡时（无需看表），离开卧室，进行一些放松活动，直到感觉有睡意再返回卧室睡觉；如果再次感觉到大约20分钟内仍然无法入睡时，重复上条策略，如果有必要，整晚都可重复该过程。'),
                            (30, '可考虑同时使用小夏的另外两个量表：《焦虑自评量表（SAS）》和《Beck抑郁自评量表（BDI）》进行测评，全面了解自己有无焦虑、抑郁等情绪问题。'),
                            (31, '建议你到专业的医疗机构进行心理健康检查。如果自感没有明显的情绪困扰，也可考虑到睡眠专科门诊寻求帮助。');

create table topic_category(
                               id int not null primary key auto_increment,
                               topic_id int not null default 0,
                               title varchar(100) not null default '',
                               introduce varchar(250) not null default '',
                               guide varchar(250) not null default '',
                               author varchar(300) not null default '',
                               minute int not null default 0 comment '所需时间',
                               color varchar(50) not null default '' comment '前端背景颜色',
                               sort int not null default 0
)ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;
insert into topic_category (topic_id, title, introduce,guide, author,minute,color,sort) VALUES (10020,'焦虑自评量表(SAS)','测试你的抑郁程度——美国著名心理学家Beck AT 编制，是目前使用最为广泛的抑郁程度评估量表之一，大量研究表明，该量表具有较高的灵敏度','共有20道题，请仔细阅读每一题，了解题目信息，然后|根据您最近一星期的实际感受|，选择每题下面适当的选项。','由华裔教授Zung编制（1971）；从量表构造的形式到具体评定的方法，都与抑郁自评量表(SDS)十分相似，是一种分析病人主观症状的相当简便的临床工具。',3,'#93B5DA',3),(10030,'失眠严重程度指数量表(ISI)','测试你的失眠严重程度——由加拿大查尔斯·莫兰教授等人编制，是目前使用最为广泛的失眠评估量表之一，广泛用于失眠筛查、评估失眠的治疗反应','共有7道题，请仔细阅读每一题，了解题目信息，然后|根据您最近两周或一个月的实际感受|，选择每题下面适当的选项。','失眠严重程度指数量表(ISI)是由加拿大的查尔斯·莫兰教授等人编制，是目前临床上使用最为广泛的失眠评估量表之一。',3,'#A0AFDF',2),(10040,'抑郁自评量表(BDI)','测试你的焦虑程度——由美国杜克大学医学院William W.K. Zung编制，是广泛用于心理咨询实践和焦虑状态筛查的主要工具之一','共有13道题，请仔细阅读每一题，了解题目的信息，然后|根据您此刻的实际感受|，选择每题下面适当的选项。','由BeckAJ编制，郑洪波、郑延平修订；',3,'#EACFA4',1);

create table chat_module(
                            id int not null primary key auto_increment,
                            title varchar(100) not null default '',
                            module varchar(100) not null default '',
                            module_name varchar(100) not null default '',
                            click int not null default 1001,
                            image varchar(200) not null default '',
                            sort int not null default 0
)ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

insert into chat_module(title, module,module_name, click, image, sort) VALUES ('应对焦虑','anxiety','学习_焦虑',13420,'theme1',3),('缓解抑郁','depression','学习_抑郁',9320,'theme2',3),('改善睡眠','sleep','治疗_睡眠_情绪',1320,'theme3',2),('放松一下','relax','工具_放松_选择',5320,'theme4',1);


-- ----------------------------
-- Table structure for positive_meditation
-- ----------------------------
DROP TABLE IF EXISTS `positive_meditation`;
CREATE TABLE `positive_meditation`  (
                                        `id` bigint(0) NOT NULL AUTO_INCREMENT,
                                        `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '音视频名称',
                                        `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '详情图',
                                        `thumbnail_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '缩略图',
                                        `toppic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '推荐图',
                                        `video_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '音视频地址',
                                        `duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '音视频时长',
                                        `explain` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '说明',
                                        `sort` int(0) NOT NULL DEFAULT 0 COMMENT '排序，数字越大越往前',
                                        `is_recommend` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否推荐，0否，1是',
                                        `play_times` int(0) NOT NULL DEFAULT 0 COMMENT '播放次数',
                                        `create_time` int(0) NOT NULL DEFAULT 0 COMMENT '创建时间',
                                        `update_time` int(0) NOT NULL DEFAULT 0 COMMENT '修改时间',
                                        `is_del` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否已删除，0否，1是',
                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '正念冥想' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of positive_meditation
-- ----------------------------
INSERT INTO `positive_meditation` VALUES (1, 'test', 'http://www.img.qiniu.wuhdajun.top/positive_meditation/iamge202260214441585.png', '', 'http://www.img.qiniu.wuhdajun.top/positive_meditation/情绪日记2202260214312358.png', 'http://www.img.qiniu.wuhdajun.top/positive_meditation/obj_wo3DlMOGwrbDjj7DisKw_14096662709_a252_56b2_45b2_8ca6a0ca473d2ab094e1cf6ea7449725202260217152624.mp3', ' 03:36', '', 12, 1, 10065, 0, 1654161328, 0);
INSERT INTO `positive_meditation` VALUES (2, 'test1', 'xxx', '', '', 'yyy', '', NULL, 300, 0, 0, 1653641011, 1654150306, 1);
INSERT INTO `positive_meditation` VALUES (3, 'aaaa', 'xxx', '', '', '', '', NULL, 123, 1, 0, 1653641068, 1654150303, 1);
INSERT INTO `positive_meditation` VALUES (4, 'aaaa', 'http://www.img.qiniu.wuhdajun.top/positive_meditation/R-C202260214275644.jpeg', '', '', 'http://www.img.qiniu.wuhdajun.top/positive_meditation/obj_wo3DlMOGwrbDjj7DisKw_14096662709_a252_56b2_45b2_8ca6a0ca473d2ab094e1cf6ea7449725202260217151391.mp3', ' 03:36', '', 123, 0, 0, 1653641169, 1654162128, 0);
INSERT INTO `positive_meditation` VALUES (5, 'test1', 'xxx', '', '', 'yyy', '', NULL, 3, 0, 0, 1653641369, 1653644544, 1);
INSERT INTO `positive_meditation` VALUES (6, 'test1', 'xxx', '', '', 'yyy', '30:50', 'aaaa', 300, 1, 98000, 1653645117, 1653723475, 1);
INSERT INTO `positive_meditation` VALUES (7, 'test1', 'xxx', '', '', 'yyy', '30:50', 'aaaa', 300, 1, 98000, 1653723565, 1653723690, 1);
INSERT INTO `positive_meditation` VALUES (8, 'ww', 'http://www.img.qiniu.wuhdajun.top/positive_meditation/iamge202260214522654.png', '', '', 'http://www.img.qiniu.wuhdajun.top/positive_meditation/obj_wo3DlMOGwrbDjj7DisKw_14096662709_a252_56b2_45b2_8ca6a0ca473d2ab094e1cf6ea7449725202260217153964.mp3', ' 03:36', '', 1, 0, 0, 1654152239, 1654161340, 0);

-- ----------------------------
-- Table structure for positive_meditation_category
-- ----------------------------
DROP TABLE IF EXISTS `positive_meditation_category`;
CREATE TABLE `positive_meditation_category`  (
                                                 `id` bigint(0) NOT NULL AUTO_INCREMENT,
                                                 `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
                                                 `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图标',
                                                 `sort` int(0) NOT NULL DEFAULT 0 COMMENT '排序，数字越大越往前',
                                                 `create_time` int(0) NOT NULL DEFAULT 0 COMMENT '创建时间',
                                                 `update_time` int(0) NOT NULL DEFAULT 0 COMMENT '更新时间',
                                                 `is_del` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否已删除，0否，1是',
                                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '正念冥想分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of positive_meditation_category
-- ----------------------------
INSERT INTO `positive_meditation_category` VALUES (1, '正念进阶', '', 123, 0, 1653555969, 0);
INSERT INTO `positive_meditation_category` VALUES (2, '疗愈音乐', '', 0, 0, 1653556287, 0);
INSERT INTO `positive_meditation_category` VALUES (3, '正念进阶1', '', 123, 1653545992, 1653549612, 1);
INSERT INTO `positive_meditation_category` VALUES (4, '正念进阶2', '', 12, 1653546011, 1653630941, 1);
INSERT INTO `positive_meditation_category` VALUES (5, '正念进阶4', '', 12, 1653632131, 1653632689, 1);
INSERT INTO `positive_meditation_category` VALUES (6, '正念进阶', '', 12, 1653644794, 1653644835, 1);
INSERT INTO `positive_meditation_category` VALUES (7, '正念进阶', '', 12, 1653644810, 1653644839, 1);
INSERT INTO `positive_meditation_category` VALUES (8, '正念进阶2', '', 12, 1653724806, 1653724836, 1);
INSERT INTO `positive_meditation_category` VALUES (9, 'ww', 'http://www.img.qiniu.wuhdajun.top/positive_meditation/2022-6-2_13:34:4227.jpg', 111, 1654141010, 1654148555, 0);

-- ----------------------------
-- Table structure for positive_meditation_tag
-- ----------------------------
DROP TABLE IF EXISTS `positive_meditation_tag`;
CREATE TABLE `positive_meditation_tag`  (
                                            `id` bigint(0) NOT NULL AUTO_INCREMENT,
                                            `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标签名称',
                                            `category_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '分类id',
                                            `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标签背景图',
                                            `explain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
                                            `sort` int(0) NOT NULL DEFAULT 0 COMMENT '排序，数字越大越往前',
                                            `is_recommend` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否推荐，0否，1是',
                                            `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图标地址',
                                            `create_time` int(0) NOT NULL DEFAULT 0 COMMENT '创建时间',
                                            `update_time` int(0) NOT NULL DEFAULT 0 COMMENT '更新时间',
                                            `is_del` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否已删除，0否，1是',
                                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '正念冥想标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of positive_meditation_tag
-- ----------------------------
INSERT INTO `positive_meditation_tag` VALUES (1, '正念入门', 0, 'http://www.img.qiniu.wuhdajun.top/lytton2022-6-1_14:21:5679.jpg', '说明', 5, 0, 'http://www.img.qiniu.wuhdajun.top/positive_meditation/2022-6-2_13:51:421.png', 1653554229, 1654163826, 0);
INSERT INTO `positive_meditation_tag` VALUES (2, '正念饮食', 1, '', '', 3, 0, '', 1653554524, 1654163822, 0);
INSERT INTO `positive_meditation_tag` VALUES (3, 'test1', 0, 'xxx', '', 4, 1, '', 1653634658, 1653644571, 1);
INSERT INTO `positive_meditation_tag` VALUES (4, 'test1', 0, '', '', 4, 1, '', 1653634677, 1653634846, 1);
INSERT INTO `positive_meditation_tag` VALUES (5, '情绪调节', 2, '', '', 4, 1, '', 1653645001, 1654163824, 0);
INSERT INTO `positive_meditation_tag` VALUES (6, '情绪调节1', 0, 'aaaa', '', 4, 0, '', 1653645008, 1653725234, 1);
INSERT INTO `positive_meditation_tag` VALUES (7, '情绪调节1', 0, 'aaaa', '', 4, 0, '', 1653725250, 1653725265, 1);
INSERT INTO `positive_meditation_tag` VALUES (8, 'ww', 1, 'http://www.img.qiniu.wuhdajun.top/lytton2022-6-1_14:45:4121.jpg', '', 1, 1, '', 1654065706, 1654066479, 1);
INSERT INTO `positive_meditation_tag` VALUES (9, 'aa', 9, '', '', 1, 0, '', 1654162075, 1654163819, 0);

-- ----------------------------
-- Table structure for positive_meditation_tag_rel
-- ----------------------------
DROP TABLE IF EXISTS `positive_meditation_tag_rel`;
CREATE TABLE `positive_meditation_tag_rel`  (
                                                `id` bigint(0) NOT NULL AUTO_INCREMENT,
                                                `record_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '正念冥想id',
                                                `tag_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '标签id',
                                                `create_time` int(0) NOT NULL DEFAULT 0 COMMENT '创建时间',
                                                `update_time` int(0) NOT NULL DEFAULT 0 COMMENT '更新时间',
                                                `is_del` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否已删除，0否，1是',
                                                PRIMARY KEY (`id`) USING BTREE,
                                                INDEX `record_id`(`record_id`) USING BTREE,
                                                INDEX `tag_id`(`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '正念冥想与标签关联关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of positive_meditation_tag_rel
-- ----------------------------
INSERT INTO `positive_meditation_tag_rel` VALUES (1, 1, 1, 0, 1654161328, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (2, 1, 3, 0, 1654161328, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (3, 2, 123, 1653641011, 1654150306, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (4, 3, 1, 1653641068, 1654150303, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (5, 3, 3, 1653641068, 1654150303, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (6, 4, 1, 1653641169, 1654162128, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (7, 4, 3, 1653641169, 1654162128, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (8, 5, 1, 1653641369, 1653644544, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (9, 5, 2, 1653641369, 1653644544, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (10, 5, 3, 1653641369, 1653644571, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (11, 5, 1, 1653641452, 1653644544, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (12, 5, 2, 1653641452, 1653644544, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (13, 5, 3, 1653641452, 1653644571, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (14, 5, 1, 1653642266, 1653644544, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (15, 5, 3, 1653642266, 1653644571, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (16, 2, 1, 1653644649, 1654150306, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (17, 2, 2, 1653644649, 1654150306, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (18, 2, 1, 1653644714, 1654150306, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (19, 2, 2, 1653644714, 1654150306, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (20, 6, 1, 1653645117, 1653723475, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (21, 6, 2, 1653645117, 1653723475, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (22, 6, 1, 1653723411, 1653723475, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (23, 6, 2, 1653723411, 1653723475, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (24, 6, 1, 1653723436, 1653723475, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (25, 6, 2, 1653723436, 1653723475, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (26, 6, 1, 1653723445, 1653723475, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (27, 6, 2, 1653723445, 1653723475, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (28, 6, 1, 1653723475, 1653723475, 0);
INSERT INTO `positive_meditation_tag_rel` VALUES (29, 6, 2, 1653723475, 1653723475, 0);
INSERT INTO `positive_meditation_tag_rel` VALUES (30, 7, 1, 1653723565, 1653723690, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (31, 7, 2, 1653723565, 1653723690, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (32, 8, 1, 1654077104, 1654161340, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (33, 8, 5, 1654077104, 1654161340, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (34, 2, 1, 1654078158, 1654150306, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (35, 4, 1, 1654151281, 1654162128, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (36, 4, 5, 1654151281, 1654162128, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (37, 1, 1, 1654151420, 1654161328, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (38, 1, 5, 1654151420, 1654161328, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (39, 1, 1, 1654151474, 1654161328, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (40, 1, 5, 1654151474, 1654161328, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (41, 1, 1, 1654151484, 1654161328, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (42, 1, 5, 1654151484, 1654161328, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (43, 1, 1, 1654151490, 1654161328, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (44, 1, 5, 1654151490, 1654161328, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (45, 1, 1, 1654151491, 1654161328, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (46, 1, 5, 1654151491, 1654161328, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (47, 8, 1, 1654152239, 1654161340, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (48, 8, 5, 1654152239, 1654161340, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (49, 1, 1, 1654152247, 1654161328, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (50, 1, 5, 1654152247, 1654161328, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (51, 1, 1, 1654152256, 1654161328, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (52, 1, 5, 1654152256, 1654161328, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (53, 4, 1, 1654152269, 1654162128, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (54, 4, 5, 1654152269, 1654162128, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (55, 8, 1, 1654152749, 1654161340, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (56, 8, 5, 1654152749, 1654161340, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (57, 8, 1, 1654152754, 1654161340, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (58, 8, 5, 1654152754, 1654161340, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (59, 8, 1, 1654152815, 1654161340, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (60, 8, 5, 1654152815, 1654161340, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (61, 4, 1, 1654154792, 1654162128, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (62, 4, 5, 1654154792, 1654162128, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (63, 4, 1, 1654158568, 1654162128, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (64, 4, 5, 1654158568, 1654162128, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (65, 1, 1, 1654158925, 1654161328, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (66, 1, 5, 1654158925, 1654161328, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (67, 4, 1, 1654161316, 1654162128, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (68, 4, 5, 1654161316, 1654162128, 1);
INSERT INTO `positive_meditation_tag_rel` VALUES (69, 1, 1, 1654161328, 1654161328, 0);
INSERT INTO `positive_meditation_tag_rel` VALUES (70, 1, 5, 1654161328, 1654161328, 0);
INSERT INTO `positive_meditation_tag_rel` VALUES (71, 8, 1, 1654161340, 1654161340, 0);
INSERT INTO `positive_meditation_tag_rel` VALUES (72, 8, 5, 1654161340, 1654161340, 0);
INSERT INTO `positive_meditation_tag_rel` VALUES (73, 4, 1, 1654162128, 1654162128, 0);
INSERT INTO `positive_meditation_tag_rel` VALUES (74, 4, 5, 1654162128, 1654162128, 0);
INSERT INTO `positive_meditation_tag_rel` VALUES (75, 4, 2, 1654162128, 1654162128, 0);



insert into suggests values (32, '研究表明，童年期原生家庭角色逆转照顾程度较低的个体的情绪控制能力更强，更少为了缓解自身焦虑而与他人情感断绝，更少因为在与他人关系上的过度卷入而受到牵制。另有研究表明，原生家庭角色逆转行为能够指向积极感受的个体，对人际关系及亲密关系都更有信心。'),
                            (33, '看起来你比很多人有更大的可能性活出自我，也有更大的可能性与他人建立真正的连结。如果事实果真如此，希望你能够保持良好自洽的人际交往模式，并能不断拥抱生命中新的可能性。'),
                            (34, '如果你感觉真的是这样，起码你现在已经有所觉察。觉察其实已经是改变的第一步，感知力也是你自身重要的能力和心理资源。'),
                            (35, '如有必要，还可以寻求更多其它的外部支持。比如心理咨询，还比如跟小夏聊天。小夏跟你一样，也在不断学习、不断成长，希望我们能够作为彼此成长路上的一个陪伴。'),
                            (36, '觉察自己作为孩子时，是否压抑和牺牲了自己被注意、安慰和引导的需求。对于现在的自己，是否存在一定的否认内心真实需求和感受的情况。'),
                            (37, '偶尔像个孩子一样自在，弥补童年的遗憾。在生活中找到一些能够让自己再次成为孩子的机会、一些能够成为真正的自己的情境，也许是突然想荡的秋千，莫名想吃的糖，小时候想去却没有去过的游乐场等等。也许小时候的你没有选择只能提前成长，但长大后的你，依然可以在一些情境中，重新成为孩子。'),
                            (38, '在照顾他人之前，优先照顾好自己。你可能在照顾他人的过程中收获了良好的情绪体验，这种行为有一定的积极意义。但如果你存在过度关注他人需求的情况，一方面，可能为自己能够满足他人的要求而骄傲，但同时可能轻视自己作为一个独特个体的价值。所以，在照顾他人之前，先重视自我照顾，无论是身体还是心理。'),
                            (39, '客观看待父母及亲子关系。我们首先需要认识到的是，父母也和其他所有人一样，都有做错的时候。客观看待父母并不意味着责备或是背叛，更不是不孝的表现。客观地看待自己与父母之间的角色颠倒问题，也许是改变的第一步。'),
                            (40, '可考虑心理咨询师的帮助。在安全的咨访关系中，在咨询师的帮助下，探索那些被压抑的感受，与你真实的内在小孩对话，开始了解、关注、重视自己的感受和需要，疗愈过去的创伤。还可以用现在成人的目光重新审视记忆中的童年，重构自我对话，尝试慢慢解开心结。'),
                            (41, '避免亲子关系模式的代际传递。也许我们很难改变父母，但我们可以改变自己。尽量不要让童年的亲子关系模式有意或无意的发生于你和孩子的相处中。'),
                            (42, '避免情感疏离或照顾者综合征等人际交往模式。研究表明一些被原生家庭角色逆转的孩子，由于严肃以及早熟，而导致他们与同伴的疏离。部分原生家庭角色逆转的孩子，在成年后通常表现出功能过度的照顾者行为。这些表现是原生家庭角色逆转经历的不同表现形式，长期而言，存在一定的负面影响。无论是过度疏离，还是忽略自身需求的过度付出，都不是在与他人建立真实的联结。'),
                            (43, '家人有他们自己独立的人生，未必需要一直是你甜蜜的负担。成长过程中，也许你和家人有着紧密的家庭关系，你也已经习惯了承担。然而有时，关系模式可能只是一种惯性。降低自己的付出可以让你更轻松，让家人更有责任感和胜任感。'),
                            (44, '客观看待父母及亲子关系。我们首先需要认识到的是，父母也和其他所有人一样，都有做错的时候。客观看待父母并不意味着责备或是背叛，更不是不孝的表现。客观地看待自己与父母之间的角色颠倒问题，也许是改变的第一步。')                           ;

CREATE TABLE `results_pi`  (
                            `id` bigint(0) NOT NULL AUTO_INCREMENT,
                            `group` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '\'分组ID\'',
                            `min_score` smallint(0) NOT NULL DEFAULT 0 COMMENT '\'对应的分数\'',
                            `max_score` smallint(0) NOT NULL DEFAULT 0 COMMENT '\'对应的分数\'',
                            `min_score2` smallint(0) NOT NULL DEFAULT 0 COMMENT '\'对应的分数\'',
                            `max_score2` smallint(0) NOT NULL DEFAULT 0 COMMENT '\'对应的分数\'',
                            `answer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
                            `tip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
                            `topic_id` int(0) NOT NULL DEFAULT 10010,
                            `is_alone` tinyint not null default 0 comment '是否独生子女',
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 517 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;


select `id`,`group`,`min_score`,`max_score`,`min_score2`,`max_score2`,`answer`,`tip`,`topic_id`,`is_alone` from `results_pi` where `min_score` <= 58 and `max_score` >= 58 and `min_score2` <= 9 and `max_score2` >= 9 and `is_alone`=0 and `topic_id`=10050 limit 1;