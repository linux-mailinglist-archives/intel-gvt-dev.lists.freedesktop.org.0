Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC3069125A
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  9 Feb 2023 22:03:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35F410EBA5;
	Thu,  9 Feb 2023 21:03:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573D810EBA7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 Feb 2023 21:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675976634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0hzi6znNyM3FxWtE65ukWP+Wt97TeNT+3DRNv4OIzVA=;
 b=bcKjwms9gIA1xSiyXvdU5/jv5K2JMEPV5/v15WOzPVY5cF+GztB+oy3Lk4LpddpKJ5oz9n
 J6iWMlKHumT1XpET9pDFRzaLHwLlmeYud0Eb5OQiFWWHeOf4jwLdySnB5Mc43mFIECXi47
 /nRqXE2SYRyW8cSUPtDDMYUGAIHMY3o=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-570-OwqPjuxpM3u_8XoCSzVNzg-1; Thu, 09 Feb 2023 16:03:53 -0500
X-MC-Unique: OwqPjuxpM3u_8XoCSzVNzg-1
Received: by mail-io1-f70.google.com with SMTP id
 b10-20020a5ea70a000000b0071a96a509a7so2043518iod.22
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 09 Feb 2023 13:03:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0hzi6znNyM3FxWtE65ukWP+Wt97TeNT+3DRNv4OIzVA=;
 b=l6sx/0UZvwO3QQRw6SSoCO5VIKwGHLjAklZern0TTGC78iLCOigHmYtCC90x3HIYi8
 +g8RTaLxShVsFrA1Fqb818ydn6gFYkNhr28Dd8YS2lxphB5NsLpkoPbD2XSJxoPyvzyx
 Ti6poF3zVUeIMEr0P03M+uzlyZo9SvVJmn4G03UnKa23wg+HsChLrXK9Nd59dWUxRDXw
 GFST10FAW12gqGxSZaMjoSzdv2/MeIVT3N8jb50Vv06G0rL43hUXdDTm24mgfvUtMTOd
 xisXxMkEF/UZUL0Zg+ZDVao1gaai7d6+aKBIWwEA3lrh04/kCFs9fnZ0wlX9weaXxeQO
 0RtA==
X-Gm-Message-State: AO0yUKXAAsVkr32vdgszhnHXLz/RrK2Y0yv0KbgJ2BHIHFNDll+40c6Z
 SG159cP7BPUpU2hCmsjkNNmRz0Ecl5xrwDx3tIkFH8v/rKE9x9EfA6U/4kv4ufHOWpuwcmnz8nN
 KrLBe0OMiz9KIjV/1aGgpWCCD3uIgB4lgAQ==
X-Received: by 2002:a05:6602:2d13:b0:704:7be5:9537 with SMTP id
 c19-20020a0566022d1300b007047be59537mr14244233iow.20.1675976632524; 
 Thu, 09 Feb 2023 13:03:52 -0800 (PST)
X-Google-Smtp-Source: AK7set9rs8OA65lw6671PZ1PpYK2stGa0HAY3gcdYk+JO8kpoT0yBNh478fTTwihnUoCWW3Y7vCO2A==
X-Received: by 2002:a05:6602:2d13:b0:704:7be5:9537 with SMTP id
 c19-20020a0566022d1300b007047be59537mr14244210iow.20.1675976632268; 
 Thu, 09 Feb 2023 13:03:52 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 c5-20020a5ea905000000b0071cbf191687sm698346iod.55.2023.02.09.13.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 13:03:51 -0800 (PST)
Date: Thu, 9 Feb 2023 14:03:26 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH v4 0/2] vfio: fix deadlock between group lock and kvm lock
Message-ID: <20230209140326.6957dca0.alex.williamson@redhat.com>
In-Reply-To: <20230203215027.151988-1-mjrosato@linux.ibm.com>
References: <20230203215027.151988-1-mjrosato@linux.ibm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: kvm@vger.kernel.org, david@redhat.com, kevin.tian@intel.com,
 imbrenda@linux.ibm.com, linux-s390@vger.kernel.org, yi.l.liu@intel.com,
 frankja@linux.ibm.com, pasic@linux.ibm.com, jgg@nvidia.com,
 borntraeger@linux.ibm.com, zhi.a.wang@intel.com, jjherne@linux.ibm.com,
 farman@linux.ibm.com, intel-gfx@lists.freedesktop.org, zhenyuw@linux.intel.com,
 intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
 pmorel@linux.ibm.com, seanjc@google.com, cohuck@redhat.com,
 linux-kernel@vger.kernel.org, pbonzini@redhat.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri,  3 Feb 2023 16:50:25 -0500
Matthew Rosato <mjrosato@linux.ibm.com> wrote:

> Hi Alex,
> 
> Here is the latest group_lock vs kvm lock deadlock fix + a non-fix
> follow-on to remove the kvm argument from vfio_device_open and
> vfio_device_first_open.
> 
> Changes from v3:
> * Remove device->group->kvm reference in vfio_main by passing the
>   kvm in (Kevin)
> * Slight re-organization to make it easier for cdev to build upon
>   this later and keep symmetry between get/put (Alex)
> * Add follow-on patch that removes unused kvm argument (Yi)
> 
> Changes from v2:
> * Relocate the new functions back to vfio_main and externalize to call
>   from group (Kevin) since cdev will need this too
> * s/vfio_kvm_*_kvm/vfio_device_*_kvm/ and only pass device as input.
>   Handle new kvm_ref_lock directly inside vfio_device_get_kvm (Alex)
> * Add assert_lockdep_held for dev_set lock (Alex)
> * Internalize error paths for vfio_device_get_kvm_safe and now return
>   void - either device->kvm is set with a ref taken or is NULL (Alex)
> * Other flow suggestions to make the call path cleaner - Thanks! (Alex)
> * Can't pass group->kvm to vfio_device_open, as it references the value
>   outside of new lock.  Pass device->kvm to minimize changes in this
>   fix (Alex, Yi)
> 
> Changes from v1:
> * use spin_lock instead of spin_lock_irqsave (Jason)
> * clear device->kvm_put as part of vfio_kvm_put_kvm (Yi)
> * Re-arrange code to avoid referencing the group contents from within
>   vfio_main (Kevin) which meant moving most of the code in this patch 
>   to group.c along with getting/dropping of the dev_set lock
> 
> Matthew Rosato (2):
>   vfio: fix deadlock between group lock and kvm lock
>   vfio: no need to pass kvm pointer during device open
> 
>  drivers/vfio/group.c     | 44 +++++++++++++++++++++----
>  drivers/vfio/vfio.h      | 18 +++++++++--
>  drivers/vfio/vfio_main.c | 70 +++++++++++++++++++++++++++++++++-------
>  include/linux/vfio.h     |  2 +-
>  4 files changed, 113 insertions(+), 21 deletions(-)
> 

Applied to vfio next branch for v6.3.  Thanks,

Alex

