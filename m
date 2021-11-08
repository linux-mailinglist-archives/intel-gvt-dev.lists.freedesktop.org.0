Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99662449D59
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  8 Nov 2021 21:59:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CA66E97F;
	Mon,  8 Nov 2021 20:59:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by gabe.freedesktop.org (Postfix) with SMTP id BC0506E97E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Nov 2021 20:59:27 +0000 (UTC)
Received: (qmail 1679175 invoked by uid 1000); 8 Nov 2021 15:59:26 -0500
Date: Mon, 8 Nov 2021 15:59:26 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v0 42/42] notifier: Return an error when callback is
 already registered
Message-ID: <20211108205926.GA1678880@rowland.harvard.edu>
References: <20211108101157.15189-1-bp@alien8.de>
 <20211108101157.15189-43-bp@alien8.de>
 <CAMuHMdWH+txiSP_d7Jc4f_bU8Lf9iWpT4E3o5o7BJr-YdA6-VA@mail.gmail.com>
 <YYkyUEqcsOwQMb1S@zn.tnic>
 <CAMuHMdXiBEQyEXJagSfpH44hxVA2t0sDH7B7YubLGHrb2MJLLA@mail.gmail.com>
 <YYlJQYLiIrhjwOmT@zn.tnic>
 <CAMuHMdXHikGrmUzuq0WG5JRHUUE=5zsaVCTF+e4TiHpM5tc5kA@mail.gmail.com>
 <YYlOmd0AeA8DSluD@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYlOmd0AeA8DSluD@zn.tnic>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, linux-iio@vger.kernel.org,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, linux-hyperv@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, Ayush Sawal <ayush.sawal@chelsio.com>,
 sparclinux <sparclinux@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 linux-leds <linux-leds@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>,
 Rohit Maheshwari <rohitm@chelsio.com>, linux-staging@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 openipmi-developer@lists.sourceforge.net,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Linux PM list <linux-pm@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 linux-um <linux-um@lists.infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 rcu@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 xen-devel@lists.xenproject.org, linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, intel-gvt-dev@lists.freedesktop.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 Parisc List <linux-parisc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, Nov 08, 2021 at 05:21:45PM +0100, Borislav Petkov wrote:
> On Mon, Nov 08, 2021 at 05:12:16PM +0100, Geert Uytterhoeven wrote:
> > Returning void is the other extreme ;-)
> > 
> > There are 3 levels (ignoring BUG_ON()/panic () inside the callee):
> >   1. Return void: no one can check success or failure,
> >   2. Return an error code: up to the caller to decide,
> >   3. Return a __must_check error code: every caller must check.
> > 
> > I'm in favor of 2, as there are several places where it cannot fail.
> 
> Makes sense to me. I'll do that in the next iteration.

Is there really any reason for returning an error code?  For example, is 
it anticipated that at some point in the future these registration calls 
might fail?

Currently, the only reason for failing to register a notifier callback 
is because the callback is already registered.  In a sense this isn't 
even an actual failure -- after the registration returns the callback 
_will_ still be registered.

So if the call can never really fail, why bother with a return code?  
Especially since the caller can't do anything with such a code value.

Given the current state of affairs, I vote in favor of 1 (plus a WARN or 
something similar to generate a stack dump in the callee, since double 
registration really is a bug).

Alan Stern
