/****************************************************************************
 ****************************************************************************
 ***
 ***   This header was automatically generated from a Linux kernel header
 ***   of the same name, to make information necessary for userspace to
 ***   call into the kernel available to libc.  It contains only constants,
 ***   structures, and macros generated from the original header, and thus,
 ***   contains no copyrightable information.
 ***
 ****************************************************************************
 ****************************************************************************/
#ifndef _MSM_MDP_H_
#define _MSM_MDP_H_

#include <linux/types.h>

#ifndef uint32_t
typedef __u32 uint32_t;
#endif

#define MSMFB_IOCTL_MAGIC 'm'
#define MSMFB_GRP_DISP _IOW(MSMFB_IOCTL_MAGIC, 1, unsigned int)
#define MSMFB_BLIT _IOW(MSMFB_IOCTL_MAGIC, 2, unsigned int)
#define MSMFB_OVERLAY_SET _IOWR(MSMFB_IOCTL_MAGIC, 135, struct mdp_overlay)
#define MSMFB_OVERLAY_UNSET _IOW(MSMFB_IOCTL_MAGIC, 136, unsigned int)
#define MSMFB_OVERLAY_PLAY _IOW(MSMFB_IOCTL_MAGIC, 137, struct msmfb_overlay_data)
#define MSMFB_OVERLAY_GET _IOR(MSMFB_IOCTL_MAGIC, 140, struct mdp_overlay)
#define MSMFB_OVERLAY_3D _IOWR(MSMFB_IOCTL_MAGIC, 147, struct msmfb_overlay_3d)
#define MSMFB_MIXER_INFO _IOWR(MSMFB_IOCTL_MAGIC, 148, struct msmfb_mixer_info_req)
#define MSMFB_OVERLAY_PLAY_WAIT _IOWR(MSMFB_IOCTL_MAGIC, 149, struct msmfb_overlay_data)

#define FB_TYPE_3D_PANEL 0x10101010
#define MDP_IMGTYPE2_START 0x10000

enum {
 MDP_RGB_565,                      // RGB 565 planer
 MDP_XRGB_8888,                    // RGB 888 padded
 MDP_Y_CBCR_H2V2,                  // Y and CbCr, pseudo planer w/ Cb is in MSB
 MDP_ARGB_8888,                    // ARGB 888
 MDP_RGB_888,                      // RGB 888 planer
 MDP_Y_CRCB_H2V2,                  // Y and CrCb, pseudo planer w/ Cr is in MSB
 MDP_YCRYCB_H2V1,                  // YCrYCb interleave
 MDP_Y_CRCB_H2V1,                  // Y and CrCb, pseduo planer w/ Cr is in MSB
 MDP_Y_CBCR_H2V1,                  // Y and CrCb, pseduo planer w/ Cr is in MSB
 MDP_RGBA_8888,                    // ARGB 888
 MDP_BGRA_8888,                    // ARGB 888
 MDP_RGBX_8888,                    // RGBX 888
#if 0 // disabled for marvel in kernel
 MDP_Y_CRCB_H2V2_TILE,             // Y and CrCb, pseudo planer tile
 MDP_Y_CBCR_H2V2_TILE,             // Y and CbCr, pseudo planer tile
#endif
 MDP_Y_CR_CB_H2V2,                 // Y, Cr and Cb, planar
 MDP_Y_CB_CR_H2V2,                 // Y, Cb and Cr, planar
 MDP_IMGTYPE_LIMIT,                // Non valid image type after this enum
 MDP_BGR_565 = MDP_IMGTYPE2_START, // BGR 565 planer
 MDP_FB_FORMAT,                    // framebuffer format
 MDP_IMGTYPE_LIMIT2                // Non valid image type after this enum
};

/* *
 * Duplicate or unspported formats that need
 * to be defined for compilation
 * */
#define MDP_Y_CBCR_H2V2_ADRENO MDP_Y_CBCR_H2V2
#define MDP_Y_CBCR_H2V2_TILE   MDP_Y_CBCR_H2V2
#define MDP_Y_CRCB_H2V2_TILE   MDP_Y_CRCB_H2V2
#define MDP_Y_CR_CB_GH2V2      MDP_Y_CR_CB_H2V2

enum {
 PMEM_IMG,
 FB_IMG,
};

#define MDP_ROT_NOP 0
#define MDP_FLIP_LR 0x1
#define MDP_FLIP_UD 0x2
#define MDP_ROT_90 0x4
#define MDP_ROT_180 (MDP_FLIP_UD|MDP_FLIP_LR)
#define MDP_ROT_270 (MDP_ROT_90|MDP_FLIP_UD|MDP_FLIP_LR)
#define MDP_DITHER 0x8
#define MDP_BLUR 0x10
#define MDP_BLEND_FG_PREMULT 0x20000
#define MDP_DEINTERLACE 0x80000000
#define MDP_SHARPENING  0x40000000
#define MDP_BLIT_NON_CACHED 0x01000000
#define MDP_OV_PIPE_SHARE 0x00800000
#define MDP_OV_PLAY_NOWAIT 0x00200000
#define MDP_SOURCE_ROTATED_90 0x00100000
#define MDP_BORDERFILL_SUPPORTED 0x00010000
#define MDP_BACKEND_COMPOSITION 0x00040000
#define MDP_MEMORY_ID_TYPE_FB 0x00001000
#define MDP_SECURE_OVERLAY_SESSION 0x00008000

#define MDP_TRANSP_NOP 0xffffffff
#define MDP_ALPHA_NOP 0xff

enum {
 MDP_BLOCK_RESERVED = 0,
 MDP_BLOCK_OVERLAY_0,
 MDP_BLOCK_OVERLAY_1,
 MDP_BLOCK_VG_1,
 MDP_BLOCK_VG_2,
 MDP_BLOCK_RGB_1,
 MDP_BLOCK_RGB_2,
 MDP_BLOCK_DMA_P,
 MDP_BLOCK_DMA_S,
 MDP_BLOCK_DMA_E,
 MDP_BLOCK_MAX,
};

struct mdp_rect {
 uint32_t x;
 uint32_t y;
 uint32_t w;
 uint32_t h;
};

struct mdp_img {
 uint32_t width;
 uint32_t height;
 uint32_t format;
 uint32_t offset;
 int memory_id;
};

struct mdp_blit_req {
 struct mdp_img src;
 struct mdp_img dst;
 struct mdp_rect src_rect;
 struct mdp_rect dst_rect;
 uint32_t alpha;
 uint32_t transp_mask;
 uint32_t flags;
};

struct mdp_blit_req_list {
 uint32_t count;
 struct mdp_blit_req req[];
};

#define MSMFB_DATA_VERSION 2

struct msmfb_data {
 uint32_t offset;
 int memory_id;
 int id;
 uint32_t flags;
 uint32_t priv;
};

#define MSMFB_NEW_REQUEST -1

struct msmfb_overlay_data {
 uint32_t id;
 struct msmfb_data data;
};

struct msmfb_img {
 uint32_t width;
 uint32_t height;
 uint32_t format;
};

enum {
 HSIC_HUE = 0,
 HSIC_SAT,
 HSIC_INT,
 HSIC_CON,
 NUM_HSIC_PARAM,
};

struct dpp_ctrl {
 int8_t sharp_strength;
 int8_t hsic_params[NUM_HSIC_PARAM];
};

struct mdp_overlay {
 struct msmfb_img src;
 struct mdp_rect src_rect;
 struct mdp_rect dst_rect;
 uint32_t z_order;	/* stage number */
 uint32_t is_fg;		/* control alpha & transp */
 uint32_t alpha;
 uint32_t transp_mask;
 uint32_t flags;
 uint32_t id;
 uint32_t user_data[8];
 struct dpp_ctrl dpp;
};

struct msmfb_overlay_3d {
 uint32_t is_3d;
 uint32_t width;
 uint32_t height;
};

struct mdp_mixer_info {
 int pndx;
 int pnum;
 int ptype;
 int mixer_num;
 int z_order;
};

#define MAX_PIPE_PER_MIXER  4

struct msmfb_mixer_info_req {
 int mixer_num;
 int cnt;
 struct mdp_mixer_info info[MAX_PIPE_PER_MIXER];
};

#endif

