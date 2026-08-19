from typing import Literal
from pydantic import Field
from rendercv.themes.classic import ClassicThemeOptions

class CustomthemeThemeOptions(ClassicThemeOptions):
    theme: Literal["customtheme"] = Field(
        default="customtheme",
        description="The theme name."
    )
