Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE62448188
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  8 Nov 2021 15:23:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B3F6E9D9;
	Mon,  8 Nov 2021 14:23:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Mon, 08 Nov 2021 14:23:44 UTC
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by gabe.freedesktop.org (Postfix) with SMTP id 7B3A56E9D8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Nov 2021 14:23:44 +0000 (UTC)
Received: (qmail 1667203 invoked by uid 1000); 8 Nov 2021 09:17:03 -0500
Date: Mon, 8 Nov 2021 09:17:03 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v0 00/42] notifiers: Return an error when callback is
 already registered
Message-ID: <20211108141703.GB1666297@rowland.harvard.edu>
References: <20211108101157.15189-1-bp@alien8.de>
 <20211108101924.15759-1-bp@alien8.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108101924.15759-1-bp@alien8.de>
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
Cc: alsa-devel@alsa-project.org, x86@kernel.org, linux-sh@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org,
 netdev@vger.kernel.org, Ayush Sawal <ayush.sawal@chelsio.com>,
 sparclinux@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Rohit Maheshwari <rohitm@chelsio.com>,
 linux-staging@lists.linux.dev, bcm-kernel-feedback-list@broadcom.com,
 xen-devel@lists.xenproject.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 rcu@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-tegra@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, intel-gvt-dev@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 linux-parisc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, Nov 08, 2021 at 11:19:24AM +0100, Borislav Petkov wrote:
> From: Borislav Petkov <bp@suse.de>
> 
> Hi all,
> 
> this is a huge patchset for something which is really trivial - it
> changes the notifier registration routines to return an error value
> if a notifier callback is already present on the respective list of
> callbacks. For more details scroll to the last patch.
> 
> Everything before it is converting the callers to check the return value
> of the registration routines and issue a warning, instead of the WARN()
> notifier_chain_register() does now.

What reason is there for moving the check into the callers?  It seems 
like pointless churn.  Why not add the error return code, change the 
WARN to pr_warn, and leave the callers as they are?  Wouldn't that end 
up having exactly the same effect?

For that matter, what sort of remedial action can a caller take if the 
return code is -EEXIST?  Is there any point in forcing callers to check 
the return code if they can't do anything about it?

> Before the last patch has been applied, though, that checking is a
> NOP which would make the application of those patches trivial - every
> maintainer can pick a patch at her/his discretion - only the last one
> enables the build warnings and that one will be queued only after the
> preceding patches have all been merged so that there are no build
> warnings.

Why should there be _any_ build warnings?  The real problem occurs when 
a notifier callback is added twice, not when a caller fails to check the 
return code.  Double-registration is not the sort of thing that can be 
detected at build time.

Alan Stern

> Due to the sheer volume of the patches, I have addressed the respective
> patch and the last one, which enables the warning, with addressees for
> each maintained area so as not to spam people unnecessarily.
> 
> If people prefer I carry some through tip, instead, I'll gladly do so -
> your call.
> 
> And, if you think the warning messages need to be more precise, feel
> free to adjust them before committing.
> 
> Thanks!
