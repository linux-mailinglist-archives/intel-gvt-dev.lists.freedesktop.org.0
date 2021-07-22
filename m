Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED463D2747
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 22 Jul 2021 18:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62D76EA36;
	Thu, 22 Jul 2021 16:09:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9766E9DD;
 Thu, 22 Jul 2021 16:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7GRzbOnE4n7J56vmgig0wV5ooQFTNp+XniFNisjegbw=; b=fTzmt3wOxBQh4aaUEOFsTaj7pz
 +1iomTiizvFOZZKqRrXS0vt+4Xwpo9yuJf1ICewYTJ7C+FIgvFco6R4wzgrCSex1EWidTkHK8R+56
 LsK8e3v16lYT/8neT/JTfTQ2bmT6PfWg1mf3bczcUSHMaoK+ZqnwKkg4Fykncyvrf6QLQzNkEZAfV
 2moy2Ln5awHG28ZJPb77dYaTHGujP6XyF2mIey2+tCszxJ8+Anjkr23no5NbRGGLn5iWo3DgKIfE6
 GraJaqknz76QlQYNZas+UVogRh8W42X+krIyJyYnW121UX9yaTJHnT4GyMDj55G1t/yBrKryJZbat
 3dnFDhkA==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m6bFk-00AQ5I-BZ; Thu, 22 Jul 2021 16:08:57 +0000
Date: Thu, 22 Jul 2021 17:08:52 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] 5.14-rc2 warnings with kvmgvt
Message-ID: <YPmYFNs2r3DBiHtf@infradead.org>
References: <YPgAuSt6Ps7w4/AI@infradead.org> <YPgD/8Y3/te/Hsu3@intel.com>
 <YPhApJo1o6yBYUh2@infradead.org> <YPiGI9tzLzGZg47j@infradead.org>
 <YPiPGv/wtnjsxSZy@intel.com> <YPjy/sYgy1SvZBD+@infradead.org>
 <20210722055523.e5tdgcledznyzmxt@ldmartin-desk2>
 <YPkcQqnRGZABpmce@infradead.org>
 <20210722160345.xi5krc5truc65t5y@ldmartin-desk2>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="QsOoP1Rtz9Mliiho"
Content-Disposition: inline
In-Reply-To: <20210722160345.xi5krc5truc65t5y@ldmartin-desk2>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Christoph Hellwig <hch@infradead.org>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--QsOoP1Rtz9Mliiho
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 22, 2021 at 09:03:45AM -0700, Lucas De Marchi wrote:
> On Thu, Jul 22, 2021 at 08:20:34AM +0100, Christoph Hellwig wrote:
> > On Thu, Jul 22, 2021 at 01:55:23AM -0400, Lucas De Marchi wrote:
> > > humn... PORT_F. KBL doesn't have PORT_F. We decided to keep the handling
> > > of DISPLAY_VER == 10 and DISPLAY_VER == 9 together and trust the VBT,
> > > but when the VBT is not present, DDI F will get added unconditio.
> > > 
> > > maybe best thing to do is to split that
> > 
> > With this and the previous patch the stack traces are gone.
> 
> maybe not the perfect fix though... can you share how you're starting
> qemu so I can try to reproduce it? I'd like to see a log with
> drm.debug=0xe param.
> 
> In theory 5a9d38b20a5a ("drm/i915/display: hide workaround for broken vbt in intel_bios.c")
> should filter out the PORT_F in KBL.

Here is my qemu script that reproduces the issue:


--QsOoP1Rtz9Mliiho
Content-Type: application/x-sh
Content-Disposition: attachment; filename="kvm-gvt.sh"
Content-Transfer-Encoding: quoted-printable

#!/bin/sh=0A=0Aqemu-system-x86_64 -enable-kvm \=0A	-m 4096 \=0A	-smp 4 \=0A=
	-kernel arch/x86/boot/bzImage \=0A	-append "root=3D/dev/vda1 console=3Dtty=
S0,115200n8 cgroup_no_v1=3Dall" \=0A	-nographic \=0A	-drive if=3Dvirtio,fil=
e=3D/home/hch/images/jessie.img,cache=3Dnone \=0A	-drive if=3Dvirtio,id=3Dt=
est,file=3D/home/hch/images/test.img,cache=3Dnone,aio=3Dnative \=0A	-drive =
if=3Dvirtio,id=3Dscratch,file=3D/home/hch/images/scratch.img,cache=3Dnone,a=
io=3Dnative \=0A	-device vfio-pci,sysfsdev=3D/sys/bus/mdev/devices/6814f392=
-50ac-4236-ae3d-26d472fd8aae=0A=0A# this actually shows output:=0A# -device=
 vfio-pci,sysfsdev=3D/sys/bus/mdev/devices/6814f392-50ac-4236-ae3d-26d472fd=
8aae,display=3Don,x-igd-opregion=3Don \=0A#	-display gtk,gl=3Don -vga none =
\=0A
--QsOoP1Rtz9Mliiho
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--QsOoP1Rtz9Mliiho--
