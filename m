Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3A86BC031
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Mar 2023 23:53:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B7110E04C;
	Wed, 15 Mar 2023 22:53:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FAB10E04C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Mar 2023 22:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678920798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PmBI1DpvKaVXYXtA6gtpu5ckoov61ccQSRAX+aljBe0=;
 b=BBLe/E5n6/PlDrYGyAYFw7SiLqg917zF06T0/tI5OL5GBgILNE2gFfkc4oATT4zThVY28A
 t0oCfsAXSUCVmA3jcQZkd6f0VRNPVi0fQKmpGa2B2CorZxmoxQU7nErakpvfgZwEGr32Bc
 FLqcRJRy3gNmKwde3WSSy3I11QUCXNo=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-ZeKV3AwKMWGCTkZfdcH5jA-1; Wed, 15 Mar 2023 18:53:17 -0400
X-MC-Unique: ZeKV3AwKMWGCTkZfdcH5jA-1
Received: by mail-il1-f197.google.com with SMTP id
 h1-20020a92d841000000b0031b4d3294dfso20086ilq.9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Mar 2023 15:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678920794;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PmBI1DpvKaVXYXtA6gtpu5ckoov61ccQSRAX+aljBe0=;
 b=vW4Dd905GxW7YLFcnqZJm57povmc7ukth4EXr9XuT3VgAB+GiJYlhtQHopjkmyM6ZW
 0chAtxUxzNXfYrUVAW5Nz6JICl6Z33xV3oGu23s84MDN+4thyHP7YLKeP5ZFtJ9kl2Fs
 iab1QRQLJutmfQyyjzFEG4YBN9OzmPNBZv9zKIYBCXquiBU5fG5gAKoul0gDxmHC5ka1
 Mfzo/mGe/XjYwLKKWZ5uYdBGLoejif/I2G5ZxwwCw9JuISArbxBrHzlA/MYEWW/o5hQh
 V5zKcwFNRwwLEPf1dWteYQqbmlh9os5Ma7+VNeLsw2WHm6gYTjIOPGBogpX16JTGt05X
 00cQ==
X-Gm-Message-State: AO0yUKWR+XEL/tcXhjghk/kDagRSU3Rd06tZ1NQC7yL+QdF3fja+EePG
 ELzCNDXap55lDy3wEDNSMGQl4cFx+WijD4KguleF5GFTu7WprNLN0wnuaxuBPNQMCjFloKTbSKj
 kwGtd3LFPWGh8Azt5lrjvZiqce7jwaM49iw==
X-Received: by 2002:a92:da05:0:b0:323:70c:ba7a with SMTP id
 z5-20020a92da05000000b00323070cba7amr6320944ilm.0.1678920794158; 
 Wed, 15 Mar 2023 15:53:14 -0700 (PDT)
X-Google-Smtp-Source: AK7set+yni0unT0KaphMd3Dk9lb2xPshPnISgvaAGSRatSEhctfH2YsA/aYF25RNbXHTAq4r4BmLNg==
X-Received: by 2002:a92:da05:0:b0:323:70c:ba7a with SMTP id
 z5-20020a92da05000000b00323070cba7amr6320918ilm.0.1678920793895; 
 Wed, 15 Mar 2023 15:53:13 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 x1-20020a0566380ca100b003c5157c8b2csm209087jad.47.2023.03.15.15.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 15:53:12 -0700 (PDT)
Date: Wed, 15 Mar 2023 16:53:11 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 12/24] vfio/pci: Allow passing zero-length fd array
 in VFIO_DEVICE_PCI_HOT_RESET
Message-ID: <20230315165311.01f32bfe.alex.williamson@redhat.com>
In-Reply-To: <20230308132903.465159-13-yi.l.liu@intel.com>
References: <20230308132903.465159-1-yi.l.liu@intel.com>
 <20230308132903.465159-13-yi.l.liu@intel.com>
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
Cc: mjrosato@linux.ibm.com, jasowang@redhat.com, xudong.hao@intel.com,
 peterx@redhat.com, terrence.xu@intel.com, chao.p.peng@linux.intel.com,
 linux-s390@vger.kernel.org, kvm@vger.kernel.org, lulu@redhat.com,
 joro@8bytes.org, nicolinc@nvidia.com, jgg@nvidia.com, kevin.tian@intel.com,
 yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org, eric.auger@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, yi.y.sun@linux.intel.com,
 cohuck@redhat.com, shameerali.kolothum.thodi@huawei.com,
 suravee.suthikulpanit@amd.com, robin.murphy@arm.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed,  8 Mar 2023 05:28:51 -0800
Yi Liu <yi.l.liu@intel.com> wrote:

> This is another method to issue PCI hot reset for the users that bounds
> device to a positive iommufd value. In such case, iommufd is a proof of
> device ownership. By passing a zero-length fd array, user indicates kernel
> to do ownership check with the bound iommufd. All the opened devices within
> the affected dev_set should have been bound to the same iommufd. This is
> simpler and faster as user does not need to pass a set of fds and kernel
> no need to search the device within the given fds.

Couldn't this same idea apply to containers?

I'm afraid this proposal reduces or eliminates the handshake we have
with userspace between VFIO_DEVICE_GET_PCI_HOT_RESET_INFO and
VFIO_DEVICE_PCI_HOT_RESET, which could promote userspace to ignore the
_INFO ioctl altogether, resulting in drivers that don't understand the
scope of the reset.  Is it worth it?  What do we really gain?

> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index d80141969cd1..382d95455f89 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -682,6 +682,11 @@ struct vfio_pci_hot_reset_info {
>   * The ownership can be proved by:
>   *   - An array of group fds
>   *   - An array of device fds
> + *   - A zero-length array
> + *
> + * In the last case all affected devices which are opened by this user
> + * must have been bound to a same iommufd_ctx.  This approach is only
> + * available for devices bound to positive iommufd.
>   *
>   * Return: 0 on success, -errno on failure.
>   */

There's no introspection that this feature is supported, is that why
containers are not considered?  ie. if the host supports vfio cdevs, it
necessarily must support vfio-pci hot reset w/ a zero-length array?
Thanks,

Alex

