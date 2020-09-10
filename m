Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2CD263ED9
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 10 Sep 2020 09:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836046E2A3;
	Thu, 10 Sep 2020 07:38:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5116E2AF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 10 Sep 2020 07:38:45 +0000 (UTC)
IronPort-SDR: wi6SSJkC+OBNS8sHJiaD07GKyP6UbsxKLtbu5fpkE/LxUCId7kns1SCcrAkXF0ZNDEtJRBs3+F
 1pdciJohKSTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="138519000"
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; d="scan'208";a="138519000"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 00:38:45 -0700
IronPort-SDR: az+Tr3jj7ln+EdqsQlSueYUEq4t48ZpbbqoQJGM3VMxhoBAP9Punvb+I6Z7zD9IrMQoXyNLpHi
 brW+2hiKJUyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; d="scan'208";a="304798603"
Received: from unknown (HELO [10.239.160.21]) ([10.239.160.21])
 by orsmga006.jf.intel.com with ESMTP; 10 Sep 2020 00:38:40 -0700
Subject: Re: Night Color not working in guests
To: intel-gvt-dev@lists.freedesktop.org
References: <65f0f6f8995ea6431b25d74fd6562f331f255317.camel@cyberus-technology.de>
 <20200910054209.GL28614@zhen-hp.sh.intel.com>
 <df9e3be3-aa04-415c-bcb6-aa3c34180dbb@cyberus-technology.de>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <50bd262b-eed6-8bc9-e134-25274b28c9e2@intel.com>
Date: Thu, 10 Sep 2020 15:38:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <df9e3be3-aa04-415c-bcb6-aa3c34180dbb@cyberus-technology.de>
Content-Language: en-US
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
Reply-To: Colin.Xu@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

How do you watch the GNOME/KDE desktop? Via dmabuf enabled vGPU in QEMU 
window, or directly vnc into the vncserver in guest?

On 2020-09-10 14:47, Thomas Prescher wrote:
> Hi,
>
> I don't know exactly what these functions are depending on, but it is
> basically the same as nightshift for Windows 10 [1] where your entire
> display image gets shifted to yellow. See an example in the link below.
>
> All the best,
> Thomas
>
> [1]
> https://support.microsoft.com/en-us/help/4027563/windows-10-set-your-display-for-night-time
>
> On 9/10/20 7:42 AM, Zhenyu Wang wrote:
>> On 2020.09.09 10:58:38 +0200, Julian Stecklina wrote:
>>> Hello everyone,
>>>
>>> we noticed that any of the Night Color modes in Gnome and KDE don't work in
>>> guests when they run with vGPUs. This is pretty easy to reproduce: Pick a GNOME
>>> or KDE Live CD and try to enable Night Color (KDE) or Night Light (GNOME).
>>>
>>> This is a bit of a minor issue, but I wonder what would be missing to make this
>>> work. Is there anything missing in Qemu or this is something that the mediator
>>> needs to handle. Does anyone have an idea?
>>>
>> I personally don't use KDE and little with GNOME. What's function those night modes
>> depend on? Display gamma config or something else?
>>
-- 
Best Regards,
Colin Xu

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
