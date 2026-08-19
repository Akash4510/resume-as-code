from typing import Literal
from rendercv.schema.models.design.classic_theme import ClassicTheme

class CustomthemeTheme(ClassicTheme):
    theme: Literal["customtheme"] = "customtheme"
