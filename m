Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EB289AB33
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  6 Apr 2024 15:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8705E10EDC4;
	Sat,  6 Apr 2024 13:57:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 324 seconds by postgrey-1.36 at gabe;
 Sat, 06 Apr 2024 13:57:29 UTC
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net
 [176.9.242.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45AE10F15C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat,  6 Apr 2024 13:57:25 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
 by bmailout3.hostsharing.net (Postfix) with ESMTPS id 94813100D943C;
 Sat,  6 Apr 2024 15:51:59 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 3B10F233389; Sat,  6 Apr 2024 15:51:59 +0200 (CEST)
Message-Id: <cover.1712410202.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Sat, 6 Apr 2024 15:52:00 +0200
Subject: [PATCH 0/2] Deduplicate bin_attribute simple read() callbacks
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 linux-acpi@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-efi@vger.kernel.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>,
 intel-gvt-dev@lists.freedesktop.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, linux-modules@vger.kernel.org
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

For my upcoming PCI device authentication v2 patches, I have the need
to expose a simple buffer in virtual memory as a bin_attribute.

It turns out we've duplicated the ->read() callback for such simple
buffers a fair number of times across the tree.

So instead of reinventing the wheel, I decided to introduce a common
helper and eliminate all duplications I could find.

I'm open to a bikeshedding discussion on the sysfs_bin_attr_simple_read()
name. ;)

Lukas Wunner (2):
  sysfs: Add sysfs_bin_attr_simple_read() helper
  treewide: Use sysfs_bin_attr_simple_read() helper

 arch/powerpc/platforms/powernv/opal.c              | 10 +-------
 drivers/acpi/bgrt.c                                |  9 +-------
 drivers/firmware/dmi_scan.c                        | 12 ++--------
 drivers/firmware/efi/rci2-table.c                  | 10 +-------
 drivers/gpu/drm/i915/gvt/firmware.c                | 26 +++++----------------
 .../intel/int340x_thermal/int3400_thermal.c        |  9 +-------
 fs/sysfs/file.c                                    | 27 ++++++++++++++++++++++
 include/linux/sysfs.h                              | 15 ++++++++++++
 init/initramfs.c                                   | 10 +-------
 kernel/module/sysfs.c                              | 13 +----------
 10 files changed, 56 insertions(+), 85 deletions(-)

-- 
2.43.0

