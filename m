Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7A65A7079
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 31 Aug 2022 00:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6B010E28E;
	Tue, 30 Aug 2022 22:18:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DDA10E28E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 30 Aug 2022 22:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661897923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TSSAWMfY5IhOGMsl4sCR/Sqq+wVCREXXNdNLZqAgz7E=;
 b=SlbKa74lYPJssd8c/BRasmJh/BCMoFRnl+LKFu990Im56H2r9rlfnBx/pOVX2WeyD+cO3o
 FYv9Aq3OVjO0cCeb16LKkwvyDQSzcG9QtFHmy/Qqt2/f0jWBkgt7YcdOlSmwj0HlMHgXb+
 EhLsUhL3sgVDc+T6UkwIx9stxfQlMAg=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-453-dyNkDP3mOWy8V80N4ub8eA-1; Tue, 30 Aug 2022 18:18:42 -0400
X-MC-Unique: dyNkDP3mOWy8V80N4ub8eA-1
Received: by mail-io1-f69.google.com with SMTP id
 n23-20020a056602341700b00689fc6dbfd6so7517249ioz.8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 30 Aug 2022 15:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc;
 bh=TSSAWMfY5IhOGMsl4sCR/Sqq+wVCREXXNdNLZqAgz7E=;
 b=fYwe2gQGiMYdye4bZQrxnqKoa0oacKNTJWH3/cIq5DTk/zT1NOQSkW4g7oOcdYstCA
 9X8UWkoMDFUbrovnnswF6hoCle6WqFbtOdPw2TiWgohr2fwudONiD1MhAJ6Hjh63QtWn
 BzHuYYTlYIhCs5oaerdD1y+rJO/QOke1uorLeYJCerTcN+i/L9RLxLAzWs1TPra8cBpV
 lIS1jjKFqLUKMHDInkkD5jeHrhxC8Mrm8KL5k4yiZ+C92tUFZ8JDyQDc5mw1oBus0+fS
 FyBRkQcK65hkDkTsDGsD2IoM7LLlWDfFJvEYCN2zPvnB0gbpcXlAr2YMtS+LLVJ6vRLN
 X9pw==
X-Gm-Message-State: ACgBeo1RBYYyIO0LQnJzDSi86WUIanUkDhZIlyxS+Xm0goU44L9lIcZk
 UU2hvrJSOU1rGdgPvNRbuK5A5x6bkpxci7vnNMPa3MNtlihBSzGLUTNEhILOtER9RK1alw9PlIu
 LIv3Fimx9ux0YJYcn5oHhGE9LtCNPGwV3oQ==
X-Received: by 2002:a05:6602:1c4:b0:689:2db5:ea0f with SMTP id
 w4-20020a05660201c400b006892db5ea0fmr11509847iot.197.1661897921391; 
 Tue, 30 Aug 2022 15:18:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR73OWrrAXNYUM7X5f/RFjdmLhOTn+HRSKcgl5cCW81jvTLPZGl1q1ozpKM9lFAFywZRpg27UQ==
X-Received: by 2002:a05:6602:1c4:b0:689:2db5:ea0f with SMTP id
 w4-20020a05660201c400b006892db5ea0fmr11509822iot.197.1661897921151; 
 Tue, 30 Aug 2022 15:18:41 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 z30-20020a056602081e00b0068b1858c81asm6110858iow.13.2022.08.30.15.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 15:18:40 -0700 (PDT)
Date: Tue, 30 Aug 2022 16:18:38 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH 15/15] vfio: Add struct device to vfio_device
Message-ID: <20220830161838.4aa47045.alex.williamson@redhat.com>
In-Reply-To: <20220827171037.30297-16-kevin.tian@intel.com>
References: <20220827171037.30297-1-kevin.tian@intel.com>
 <20220827171037.30297-16-kevin.tian@intel.com>
Organization: Red Hat
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Leon Romanovsky <leon@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>,
 Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Sun, 28 Aug 2022 01:10:37 +0800
Kevin Tian <kevin.tian@intel.com> wrote:

> From: Yi Liu <yi.l.liu@intel.com>
> 
> and replace kref. With it a 'vfio-dev/vfioX' node is created under the
> sysfs path of the parent, indicating the device is bound to a vfio
> driver, e.g.:
> 
> /sys/devices/pci0000\:6f/0000\:6f\:01.0/vfio-dev/vfio0
> 
> It is also a preparatory step toward adding cdev for supporting future
> device-oriented uAPI.

Shall we start Documentation/ABI/testing/vfio-dev now?  Thanks.

Alex

