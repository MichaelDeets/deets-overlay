EAPI=8
inherit cmake git-r3

DESCRIPTION="A generic implicit Vulkan layer for low latency frame pacing"
HOMEPAGE="https://github.com/Korthos-Software/low_latency_layer"
EGIT_REPO_URI="https://github.com/Korthos-Software/low_latency_layer.git"

LICENSE="MIT"
SLOT="0"

# vulkan-utility-libraries must be built without LTO
DEPEND="
	dev-util/vulkan-headers
	dev-util/vulkan-utility-libraries
"

RDEPEND="
	${DEPEND}
	media-libs/vulkan-loader
"
